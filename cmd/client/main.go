package main

import (
	"crypto/tls"
	"log"
	"net/http"

	"github.com/quic-go/quic-go"
	"github.com/quic-go/quic-go/http3"
)

func main() {
	tr := &http3.Transport{
		TLSClientConfig: &tls.Config{InsecureSkipVerify: true},
		QUICConfig:      &quic.Config{},
	}
	defer tr.Close()
	client := &http.Client{Transport: tr}

	resp, err := client.Get("https://nghttp2.org:4433")
	//resp, err := client.Get("https://127.0.0.1:8000/")
	if err != nil {
		log.Fatal(err)
	}
	log.Println(resp.StatusCode, resp.Proto)
}
