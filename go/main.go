package main

import (
	"github.com/99designs/gqlgen/handler"
	"github.com/csandiego/poc-graphql/go/gqlgen"
	"github.com/csandiego/poc-graphql/go/service"
	"log"
	"net/http"
)

const (
	graphqlPath = "/graphql"
)

func main() {
	service := service.NewInMemoryBookService()
	resolver := gqlgen.NewResolver(service)

	http.Handle("/", handler.Playground("GraphQL playground", graphqlPath))
	http.Handle(graphqlPath, handler.GraphQL(gqlgen.NewExecutableSchema(gqlgen.Config{Resolvers: resolver})))
        log.Fatal(http.ListenAndServe(":80", nil))
}
