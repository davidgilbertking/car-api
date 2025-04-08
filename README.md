<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Car API

This API is designed to manage cars, configurations, options, and pricing. It includes:

- Cars CRUD
- Options CRUD
- Configurations CRUD
- Pricing management with date validity
- Public endpoint for available cars with prices
- Swagger documentation for easy interaction

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/davidgilbertking/car-api.git
cd car-api
```

### 2. Install dependencies

```bash
composer install
```

### 3. Configure environment

```bash
cp .env.example .env
php artisan key:generate
```

### 4. Set up the database

Make sure your `.env` is configured to use PostgreSQL, then run:

```bash
php artisan migrate
```

### 5. Run the server

```bash
php artisan serve
```

---

## API Documentation

Swagger UI is available at:

[http://127.0.0.1:8000/api/documentation](http://127.0.0.1:8000/api/documentation)

This interface allows you to:

- Explore all endpoints
- Test requests
- View models and validation rules

---

## Public Endpoint

To get a list of all available cars with configurations, options, and active prices:

```
GET /api/cars/available
```

Only configurations with currently valid prices will be returned.  
This endpoint is cached in Redis for 10 minutes.

---

## Testing

You can test the API using tools like **Postman**, **HTTPie**, or **cURL**.

Example requests:

```bash
curl http://127.0.0.1:8000/api/cars
curl -X POST -H "Content-Type: application/json" \
     -d '{"name":"Toyota Corolla"}' \
     http://127.0.0.1:8000/api/cars
```

---

## Database Dump

To restore the database from a dump file:

```bash
psql -U <username> -d car_catalog -f car_catalog_dump.sql
```

Replace `<username>` with your PostgreSQL username.

---

## Technologies Used

- Laravel 11+
- PostgreSQL
- Redis
- Swagger (L5-Swagger)

---

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
