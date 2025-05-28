package main

import (
	"log"
	"net/http"

	"github.com/quic-go/quic-go/http3"
)

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Alt-Svc", "h3=\":8000\"; ma=86400")
		w.WriteHeader(http.StatusOK)
	})
	if err := http3.ListenAndServeQUIC("0.0.0.0:8000", "/etc/certs/ssl.crt", "/etc/certs/ssl.key", mux); err != nil {
		log.Fatal(err)
	}
}
