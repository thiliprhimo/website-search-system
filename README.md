# Website-Wide Search System – Machine Test

A Laravel 10 + MeiliSearch-based universal search engine that can search across multiple models like BlogPost, Product, Page, and FAQ via a single endpoint.

---

## Features Implemented

- Dockerized Laravel + MySQL + MeiliSearch setup
- Models: `BlogPost`, `Product`, `Page`, `Faq`
- Seeders & Factories with realistic dummy data
- Laravel Scout + MeiliSearch integration
- `/api/search?q=` universal search endpoint
- Results paginated and structured
- Basic ranking based on model match
- Optional features like queue and filters are skipped as per instruction

---

## Project Structure

website-search-system/
├── src/ # Laravel App
├── docker-compose.yml
├── Dockerfile
├── README.md
└── .env.example

---

## How to Run This Project (From Scratch)

### Step 1: Clone the Repository

```bash
git clone https://github.com/thiliprhimo/website-search-system.git
cd website-search-system

### Step 2: Start Docker Services

docker-compose build --no-cache
docker-compose up -d

### Step 3: Access Laravel Container

docker ps
docker exec -it website-search-system-app-1 bash

### Step 4: Migrate and Seed Data

php artisan migrate --seed

### Step 5: Import Data to MeiliSearch

php artisan scout:import "App\Models\BlogPost"
php artisan scout:import "App\Models\Product"
php artisan scout:import "App\Models\Page"
php artisan scout:import "App\Models\Faq"

---

API Endpoint

GET /api/search?q=apple

---

### Technologies Used
PHP 8.2

Laravel 12

Laravel Scout

MeiliSearch

MySQL 8

Docker + Docker Compose

### Environment Setup

APP_NAME=Laravel
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost:8088

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=root

SCOUT_DRIVER=meilisearch
MEILISEARCH_HOST=http://scout:7700


### Important Notes
This is a backend-only implementation.

Optional features like UI filters, async indexing via queue, and front-end SPA are out of scope for this task but can be extended easily.



