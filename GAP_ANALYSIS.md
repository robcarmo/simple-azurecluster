# Gap Analysis: README vs. Codebase (Updated)

This document outlines the discrepancies found between the `readme` file and the actual code and structure within this repository. It also tracks the changes made to align the repository structure with the `readme`.

## Summary of Discrepancies (Updated)

The `readme` file describes a comprehensive project involving a Python-based API, a PostgreSQL database, extensive Azure infrastructure managed by Terraform, containerization with Docker, orchestration with Helm, and a CI/CD pipeline for deployment to Azure Kubernetes Service (AKS).

The actual application code remains a basic "Hello World" Node.js application. However, significant efforts have been made to create the directory structures, placeholder configuration files, and naming conventions described in the `readme` for Docker, Helm, Terraform, and CI/CD workflows.

## Specific Gaps Identified (Updated Status)

1.  **Application Language and Functionality:**
    *   **README:** Describes a Python API (mentioning `main.py`, `requirements.txt`). It also implies functionality requiring a database.
    *   **Codebase:** Contains a Node.js Express application (`app/app.js`, `app/package.json`) that serves a simple "Hello World" message and has no database interaction.
    *   **Status:** This gap remains. The core application logic has not been changed to Python, as per user request to keep the Node.js app. Placeholder Python files (`docker/api/app/...`) have been created to match the `readme`'s described structure for the Dockerized application.

2.  **Directory Structure (Overall):**
    *   **README:** Proposes a directory structure like `docker/api/app/` for application code, `helm/sample-api/` for Helm charts, `terraform/modules/` for Terraform modules, and `k8config/`.
    *   **Codebase (Initial):** The application code was in `app/`. The `docker/`, `helm/`, `terraform/` (as described in the README), and `k8config/` directories were largely missing or structured differently.
    *   **Status:** Addressed. The specified directory structures for `docker/api/app/`, `helm/`, `terraform/` (including renaming `infra/`), and `k8config/` have been created.

3.  **Database:**
    *   **README:** Extensively details the planning, setup, configuration, and deployment of a database (specifically PostgreSQL), including Helm charts (`helm/postgresql/`) and Terraform modules (`terraform/modules/database/`).
    *   **Codebase:** No actual database is implemented. The Node.js app does not interact with a database.
    *   **Status:** Partially addressed by creating placeholder structures. `helm/postgresql/` and `terraform/modules/database/` structures with placeholder files have been created as per the `readme`. No functional database is implemented.

4.  **Application Port:**
    *   **README:** Does not explicitly state the API port.
    *   **Codebase:** The Node.js application in `app/app.js` listens on port `8080`.
    *   **Status:** Unchanged. This is a minor detail specific to the running application.

5.  **Dockerfile Location:**
    *   **README:** Specifies `docker/api/Dockerfile`.
    *   **Codebase (Initial):** The Dockerfile was located at `app/Dockerfile`.
    *   **Status:** Addressed. The Dockerfile has been moved to `docker/api/Dockerfile`, and its internal paths adjusted to correctly copy the Node.js app from the `app/` directory.

6.  **Helm Chart Presence and Location:**
    *   **README:** Describes Helm charts for a sample API (`helm/sample-api/`) and PostgreSQL (`helm/postgresql/`).
    *   **Codebase (Initial):** These Helm chart directories were not present.
    *   **Status:** Addressed. Placeholder directories and files for `helm/sample-api/` and `helm/postgresql/` have been created as specified.

7.  **Terraform Modules and Structure:**
    *   **README:** Details a `terraform/` directory with multiple modules (e.g., `acr`, `aks`, `database`, `networking`).
    *   **Codebase (Initial):** An `infra/` directory existed with a `modules/storage/` subdirectory.
    *   **Status:** Addressed. The `infra/` directory has been renamed to `terraform/`. The module structure described in the `readme` (for `acr`, `aks`, `app-insights`, `database`, `networking`, `log-analytics`) has been created with placeholder files within `terraform/modules/`. The existing `storage` module is preserved under this new structure. Placeholder `.tf` files also added to the root `terraform/` directory.

8.  **CI/CD Workflow File Naming:**
    *   **README:** Mentions `.github/workflows/build-and-push-docker.yml` and `.github/workflows/deploy-to-aks.yml`.
    *   **Codebase (Initial):** The existing workflow file was `.github/workflows/app-build.yaml`.
    *   **Status:** Addressed. `.github/workflows/app-build.yaml` has been renamed to `.github/workflows/build-and-push-docker.yml`, and a placeholder `.github/workflows/deploy-to-aks.yml` has been created.

## Conclusion (Updated)

Significant progress has been made in aligning the repository's structure, directory layout, and configuration file placeholders with the descriptions in the `readme`. While the core application remains a Node.js "Hello World" app (not the Python API described), the surrounding scaffolding for Docker, Helm, Terraform, and CI/CD now largely matches the `readme`'s specifications at a structural level. The primary remaining gap is the application logic itself and any actual database implementation.
