# Financial Analytics ELT Pipeline

An end-to-end automated ELT (Extract, Load, Transform) data pipeline designed to ingest, process, and model daily stock market data. This project leverages **Apache Airflow**, **dbt (data build tool)**, **PostgreSQL**, and **yfinance** running inside **Docker containers**.

---

## 🏗️ Architecture & Tech Stack

* **Orchestration:** Apache Airflow (DAGs configured with sequential task dependencies and concurrency controls).
* **Ingestion:** Python (using `yfinance` to fetch live historical stock data) with incremental append logic.
* **Transformation & Modeling:** dbt-postgres (Staging, Marts, and incremental model builds).
* **Database:** PostgreSQL.
* **Environment:** Docker & Docker Compose.

---

## 📂 Project Structure

```text
financial_analytics/
│
├── airflow/                  # Airflow configuration and DAGs
│   └── dags/
│       └── stock_market_elt_pipeline.py
│
├── financial_analytics/      # dbt project root
│   ├── models/
│   │   ├── staging/          # Staging models (cleaning raw data)
│   │   └── marts/            # Business-ready models and aggregations
│   ├── seeds/                # Static reference data (e.g., stocks.csv)
│   ├── dbt_project.yml       # dbt project configuration
│   └── profiles.yml          # Database connection profiles
│
└── docker-compose.yml        # Infrastructure setup (Airflow + Postgres)
