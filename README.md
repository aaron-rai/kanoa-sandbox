# kanoa-sandbox

A template for running a local Kanoa MES development environment using Docker.

## Services

- **gateway** — Ignition 8.3.6 (Standard Edition) with the Kanoa MES, BIJC Calendar, and Embr Charts modules pre-loaded
- **database** — Azure SQL Edge (ARM-native, Developer Edition) running on port 1433
- **db-init** — One-shot container that runs the SQL init scripts against the database on first boot, then exits

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/) with Compose

## Getting Started

```bash
docker compose up
```

Ignition will be available at http://localhost:8088.

> **Note:** The database is ephemeral — it resets on every `docker compose down`. The schema is recreated automatically from the scripts in `services/mssql/init-sql/` on each startup.

## Database

| Setting  | Value       |
|----------|-------------|
| Host     | `localhost` |
| Port     | `1433`      |
| Database | `kanoa`     |
| Username | `kanoa`     |
| Password | `P@ssword1!`|

## Project Structure

```
services/
  ignition/
    config/       # Ignition gateway config
    projects/     # Ignition projects
    commissioning.json
  mssql/
    init-sql/     # SQL scripts run on startup to initialize the database
  third-party-modules/  # Ignition .modl files
```
