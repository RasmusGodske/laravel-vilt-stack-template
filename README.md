# Introduction

##  Laravel Stack: Vue.js, Inertia.js, Laravel 11, Tailwind CSS

This repository contains a Laravel stack that is designed to offer a comprehensive and efficient development environment for web applications. It integrates several modern technologies to facilitate a smooth and scalable development process

This setup is a direct implementation of the best practices and configurations I discussed in my blog post on creating the optimal Laravel stack "[Creating the perfect Laravel stack with VSCode DevContainer](https://rasmusgodske.com/posts/setting-up-the-perfect-laravel-stack/)".

## Technologies Used in the Stack
This stack is built using a combination of technologies best suited for modern web application development:

- **Laravel 11**: The latest version of Laravel, providing a robust framework for building web applications.
- **Vue.js**: A progressive JavaScript framework for building user interfaces.
- **Inertia.js**: A library that allows you to create single-page apps using classic server-side routing and controllers.
- **Tailwind CSS**: A utility-first CSS framework for rapidly building custom designs.
- **VSCode Devcontainer**: Provides a fully Dockerized development environment, configured specifically for this stack, to ensure consistency across all development setups.
- **Laravel Sail**: A light-weight command-line interface for managing Docker containers, specifically tailored for Laravel applications.


Feel free to explore the repository and contribute to the project. If you encounter any issues or have any suggestions for improvements, please open an issue or submit a pull request.

## Relavant Documentation
- [Laravel 11 Documentation](https://laravel.com/docs/11.x)
- [Vue.js](https://vuejs.org/guide/introduction)
- [Inertia.js](https://inertiajs.com/pages)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [VSCode Devcontainer](https://code.visualstudio.com/docs/devcontainers/containers)
- [Laravel Sail](https://laravel.com/docs/11.x/sail)


# Quick Start Guide

To get started with this Laravel stack, follow these simple steps after cloning the repository:

## Prerequisites
Make sure you have Docker installed on your machine as this stack uses Laravel Sail for container management. If you don't have Docker, download it from Docker's official site. Also this stack uses VSCode DevContainers for development environment, so make sure you have the [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed in your VSCode.

### Step 1: Clone the repository

```bash
git git@github.com:RasmusGodske/laravel-vilt-stack-template.git
cd laravel-vilt-stack-template
```

### Step 2: Start the devcontainer

Open the repository in VSCode and click on the green button in the bottom left corner of the window. This will open a prompt asking you to reopen the repository in a container. Click on "Reopen in Container" and wait for the container to build.

Alternatively, you can open the command palette (Ctrl+Shift+P) and search for "Dev Containers: Reopen container" or `Dev Containers: Rebuild and Reopen in Container`.

> [!NOTE]
> This may take a while the first time you run it as it needs to download the Docker images and build the container.

### Step 3: Create a `.env` file

Create a `.env` file by copying the `.env.example` file:

```bash
cp .env.example .env
```

### Step 4 - Option #1: Start the environment (Easy way)

Once the container is built, you can start the environment by running the this custom script that bootstraps the application. This will:
- Install the composer dependencies
- Install the npm dependencies
- Migrate and seed the database
- Clear and cache the configuration (Very useful to avoid unexpected errors)
- Start the vite build server

```bash
./scripts/bootstrap.sh
```

> [!NOTE]
> This may take a while the first time you run it as it needs to download the Docker images.


### Step 4 - Option #2: Start the environment (Manual way)
This script will install the composer dependencies, generate the application key, run the migrations, and start the development server.

Alternatively, you can run the commands manually:

```bash
sail up
```

Open a new terminal and run:

```bash
sail composer install
sail npm install
sail npm run dev
```

### Step 5: Access the application

You can now access the application by visiting [http://localhost:8080/dashboard](http://localhost:8080/dashboard) in your browser.


### Step 6: Profit

You are now ready to start developing your application. Happy coding!

