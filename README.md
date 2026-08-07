# ecommerce-db-schema-design/ Data SQL Analysis

SQL practice project analyzing a 30,000-row e-commerce dataset (41 columns) from Kaggle, including relational table splitting/normalization and a structured query practice set across five difficulty levels — built as part of a hands-on PostgreSQL learning routine.

## Overview

- **Goal:** Take a flat, denormalized e-commerce dataset and split it into a normalized relational schema, then practice SQL querying against it — from basic SELECTs through advanced joins, aggregations, and subqueries.
- **Why:** Hands-on practice for MEL/data analysis work and general SQL fluency for freelance/remote data roles.
- **Stack:** PostgreSQL (Docker), pgAdmin, DBeaver/psql for querying.

## Dataset

- **Source:** [Kaggle — https://www.kaggle.com/search?q=Ecommerce]
- **Original shape:** ~30,000 rows × 41 columns (single flat table)
- **Notes/assumptions:** [Add any cleaning steps, e.g. dropped duplicates, handled nulls, converted date formats, etc.]

## Schema Design

The original flat table was split into normalized tables to reduce redundancy and reflect real-world relational structure. Example split (edit to match your actual schema):

- `customers` — customer_id, name, email, region, etc.
- `orders` — order_id, customer_id (FK), order_date, status
- `order_items` — order_item_id, order_id (FK), product_id (FK), quantity, price
- `products` — product_id, product_name, category, unit_price

Normalization rationale-Split to 3NF to eliminate repeating customer/product data per row and support proper joins

## Setup / How to Run

```bash
# Start the Postgres container
docker-compose up -d

# Connect (remapped to 5433 due to a native Postgres install on the host)
psql -h localhost -p 5433 -U postgres -d ecommerce

# Load schema and data
\i sql/schema/create_tables.sql
\i sql/schema/load_data.sql
```

> **Note:** `.env` and any credentials are excluded from this repo — see `.env.example` for the required variables.

## Query Practice Set

Organized by difficulty, matching a 5-level, 15-query practice structure:

| Level | Focus | File |
|---|---|---|
| 1 — Basic | SELECT, WHERE, ORDER BY, LIMIT | `sql/queries/01_basics.sql` |
| 2 — Filtering & Sorting | Multi-condition filters, aliasing | `sql/queries/02_filtering.sql` |
| 3 — Joins | INNER/LEFT/RIGHT joins across split tables | `sql/queries/03_joins.sql` |
| 4 — Aggregation | GROUP BY, HAVING, aggregate functions | `sql/queries/04_aggregation.sql` |
| 5 — Advanced | Subqueries, window functions, CTEs | `sql/queries/05_advanced.sql` |

## Key Learnings

- Normalization reduces data redundancy but increases join complexity — trade-off worth understanding for query performance.
- Window functions solved ranking problems that GROUP BY alone couldn't."

## Folder Structure

```
├── sql/
│   ├── schema/
│   │   ├── create_tables.sql
│   │   └── load_data.sql
│   └── queries/
│       ├── 01_basics.sql
│       ├── 02_filtering.sql
│       ├── 03_joins.sql
│       ├── 04_aggregation.sql
│       └── 05_advanced.sql
├── docker-compose.yml
├── .env.example
├── .gitignore
└── README.md
```

## Author

**Temwanani Ray Manda** — [GitHub: africanDillinger](https://github.com/africanDillinger)
