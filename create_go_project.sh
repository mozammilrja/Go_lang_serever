#!/bin/bash

# Create the main project directory
mkdir -p myapp/cmd myapp/internal/app/handlers myapp/internal/app/middlewares myapp/internal/app/models myapp/internal/app/routes myapp/internal/config myapp/internal/web myapp/migrations myapp/pkg myapp/third_party

# Create the main.go file
cat <<EOL > myapp/cmd/main.go
package main

import (
	"fmt"
	"log"
	"net/http"

	"myapp/internal/app/routes"
)

func main() {
	router := routes.NewRouter()

	port := ":8080"
	fmt.Printf("Starting server on port %s...\n", port)
	if err := http.ListenAndServe(port, router); err != nil {
		log.Fatal(err)
	}
}
EOL

# Create a sample .env file
echo "APP_ENV=development" > myapp/.env

# Create a sample README.md file
cat <<EOL > myapp/README.md
# My Go Application

This is a simple Go application.

## Getting Started

To get started, follow these steps:

1. Clone the repository.
2. Configure your environment variables by creating a .env file.
3. Build and run the application.

## Usage

- Run the application: \`go run cmd/main.go\`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
EOL

# Create an empty .gitignore file
touch myapp/.gitignore

# Create a go.mod file
cat <<EOL > myapp/go.mod
module myapp

go 1.17

require (
	# Add your dependencies here
)
EOL

# Create a go.sum file
touch myapp/go.sum

# Create a migrations directory and an example SQL migration file
mkdir -p myapp/migrations
cat <<EOL > myapp/migrations/001_initial.sql
-- Add your database schema migration here
EOL

# Create sample code files for handlers, middlewares, models, and routes
cat <<EOL > myapp/internal/app/handlers/handlers.go
package handlers

// Add your HTTP request handlers here
EOL

cat <<EOL > myapp/internal/app/middlewares/middlewares.go
package middlewares

// Add your HTTP middlewares here
EOL

cat <<EOL > myapp/internal/app/models/models.go
package models

// Add your data models and database schema here
EOL

cat <<EOL > myapp/internal/app/routes/routes.go
package routes

import (
	"net/http"
)

func NewRouter() *http.ServeMux {
	router := http.NewServeMux()

	// Define your API routes here

	return router
}
EOL

# Create a sample index.html file
mkdir -p myapp/internal/web
echo "<!DOCTYPE html><html><head><title>My Web App</title></head><body><h1>Hello, World!</h1></body></html>" > myapp/internal/web/index.html

echo "Project structure and sample files created successfully!"
