# PHP Vanilla Boilerplate

![PHP](https://img.shields.io/badge/PHP-8.4-777BB4?style=flat&logo=php&logoColor=white)
[![License](https://img.shields.io/github/license/mrhdolek/php-vanilla-boilerplate?color=428f7e&logo=open%20source%20initiative&logoColor=white)](https://github.com/your-username/php-vanilla-boilerplate/blob/master/LICENSE)

---

#### A simple PHP Vanilla Boilerplate for modern web development

Clean, simple, and modern PHP boilerplate with Docker support, testing, and development tools.

## Project setup

You can run this project using either **Docker** (via Make commands) or **Nix**. Choose the option that best fits your workflow.

## 🐳 Docker Environment

### Prerequisites
- Docker and Docker Compose
- Make (for Windows: install from [here](http://gnuwin32.sourceforge.net/packages/make.htm))

### Setup and Usage

#### Development
If you have problems with permissions please add sudo before make example:
- `sudo make install`
- `sudo make start`

#### Mac/Linux
```bash
make install
make start
```

#### Windows
```bash
make install
make start
```

#### Address where the environment is available
- `http://localhost:8000`

#### All Docker commands
- `make help` - Show all available commands

## ❄️ Nix Environment

### Prerequisites
- [Nix package manager](https://nixos.org/download.html)

### Setup and Usage

#### Enter development environment
```bash
# Enter the Nix shell (automatically installs all dependencies)
nix-shell
```

#### Development workflow with Nix
```bash
# Enter Nix shell
nix-shell

# Check PHP version and path
type php
php --version

# Install PHP dependencies
composer install

# Start development server
php -S localhost:8000 -t public/

# Run tests
composer test

# Code quality checks
composer phpstan
composer cs-fix
```

## All commands

- `make help`

### Running tests

```bash
# Run all tests
composer test

```

### Code quality tools

The boilerplate includes several code quality tools:

- **PHPStan** - Static analysis tool
- **PHP-CS-Fixer** - Code style fixer
- **PHPUnit** - Testing framework

### Running development server

```bash
# Using PHP built-in server
php -S localhost:8000 -t public/
```

### Dependency management

```bash
# Install dependencies
composer install

# Update dependencies
composer update

# Add new dependency
composer require vendor/package

# Add development dependency
composer require --dev vendor/package
```

## Documentation

Learn more about the tools used in this boilerplate:

- [PHP Official Documentation](https://www.php.net/docs.php)
- [Composer](https://getcomposer.org/doc/)
- [PHPUnit](https://phpunit.de/documentation.html)
- [PHPStan](https://phpstan.org/user-guide/getting-started)
- [Docker](https://docs.docker.com/)
- [PHP-CS-Fixer](https://cs.symfony.com/)