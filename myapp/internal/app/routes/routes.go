package routes

import (
	"net/http"
)

func NewRouter() *http.ServeMux {
	router := http.NewServeMux()

	// Define your API routes here

	return router
}
