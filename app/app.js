const express = require('express');
const { Pool } = require('pg');
const app = express();
const port = process.env.PORT || 8080; // Use environment variable for port

// Database connection configuration
const pool = new Pool({
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  user: process.env.DB_USER || 'user',
  password: process.env.DB_PASSWORD || 'password',
  database: process.env.DB_NAME || 'mydatabase',
  ssl: process.env.DB_SSL === 'true' ? { rejectUnauthorized: false } : false, // Basic SSL handling
});

// Function to initialize the database table
async function initializeDatabase() {
  try {
    const client = await pool.connect();
    await client.query(`
      CREATE TABLE IF NOT EXISTS visits (
        id SERIAL PRIMARY KEY,
        visit_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      );
    `);
    console.log('Database table "visits" initialized or already exists.');
    client.release();
  } catch (err) {
    console.error('Error initializing database table:', err.stack);
    // Exit or handle error appropriately if DB init fails
    // For a simple app, we might let it continue and fail on query
  }
}

// Middleware to parse JSON bodies (if you plan to use POST requests)
app.use(express.json());

app.get('/', async (req, res) => {
  try {
    const client = await pool.connect();
    // Insert a new visit
    await client.query('INSERT INTO visits (visit_time) VALUES (NOW())');
    
    // Retrieve all visits
    const result = await client.query('SELECT visit_time FROM visits ORDER BY visit_time DESC LIMIT 10'); // Get last 10 visits
    client.release();
    
    let responseHtml = '<h1>Hello World with Database!</h1><h2>Previous Visits (up to 10):</h2><ul>';
    if (result.rows.length > 0) {
      result.rows.forEach(row => {
        responseHtml += `<li>${new Date(row.visit_time).toLocaleString()}</li>`;
      });
    } else {
      responseHtml += '<li>No visits recorded yet.</li>';
    }
    responseHtml += '</ul>';
    res.send(responseHtml);

  } catch (err) {
    console.error('Error handling request:', err.stack);
    res.status(500).send('Something went wrong!');
  }
});

// Simple health check endpoint
app.get('/healthz', (req, res) => {
  // Could add a DB ping here if desired
  res.status(200).send('OK');
});

// Start the server after initializing the database
initializeDatabase().then(() => {
  app.listen(port, '0.0.0.0', () => {
    console.log(`Server running on port ${port}`);
    console.log('Connected to PostgreSQL on host:', process.env.DB_HOST || 'localhost');
  });
}).catch(err => {
    console.error('Failed to start server due to database initialization issues:', err);
});
