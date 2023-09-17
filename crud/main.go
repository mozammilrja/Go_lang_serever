package main

import (
	"fmt"
	"net/http"
	// "github.com/julienschmidt/httprouter"
	// "gopkg.in/mgo.v2"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, World! important")
	})

	port := ":8000"
	fmt.Printf("Starting server on port %s...\n", port)
	if err := http.ListenAndServe(port, nil); err != nil {
		panic(err)
	}
}
