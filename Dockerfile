FROM php:8.2-fpm

# System dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    curl \
    unzip \
    git \
    libzip-dev \
    libpq-dev \
    libcurl4-openssl-dev

# ✅ Install PHP extensions (this was missing!)
RUN docker-php-ext-install pdo pdo_mysql

# Install Composer manually
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Set working directory
WORKDIR /var/www

# Copy Laravel project
COPY ./src .

# Install PHP dependencies
RUN composer install

# Start Laravel server
CMD php artisan serve --host=0.0.0.0 --port=8000
