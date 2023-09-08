package main

import (
	"fmt"
	"log"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	if err := r.ParseForm(); err != nil {
		http.Error(w, fmt.Sprintf("Error parsing: %v", err), http.StatusBadRequest)
		return
	}

	fmt.Fprintln(w, "POST request successfully")
	name := r.FormValue("name")
	address := r.FormValue("address")
	fmt.Fprintf(w, "name: %s\n", name)
	fmt.Fprintf(w, "address: %s\n", address)
}

func formHandler(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/hello" {
		http.Error(w, "404 not found", http.StatusNotFound)
		return
	}
	if r.Method != http.MethodGet {
		http.Error(w, "Method not supported", http.StatusMethodNotAllowed)
		return
	}

	fmt.Fprintln(w, "Hello")
}

func main() {
	fileServer := http.FileServer(http.Dir("./static"))
	http.Handle("/", fileServer)
	http.HandleFunc("/form", formHandler)
	http.HandleFunc("/hello", helloHandler)

	fmt.Println("Starting server at port 8080...")

	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}
