package gqlgen

import (
	"context"
	"github.com/csandiego/poc-graphql/go/data"
	"github.com/csandiego/poc-graphql/go/service"
) // THIS CODE IS A STARTING POINT ONLY. IT WILL NOT BE UPDATED WITH SCHEMA CHANGES.

type Resolver struct{
	service service.BookService
}

func NewResolver(service service.BookService) *Resolver {
	return &Resolver{service: service}
}

func (r *Resolver) Mutation() MutationResolver {
	return &mutationResolver{r}
}
func (r *Resolver) Query() QueryResolver {
	return &queryResolver{r}
}

type mutationResolver struct{ *Resolver }

func (r *mutationResolver) CreateBook(ctx context.Context, book BookMutation) (*bool, error) {
	return nil, r.service.Create(data.Book{Title: book.Title, Author: book.Author})
}
func (r *mutationResolver) UpdateBook(ctx context.Context, id int, book BookMutation) (*bool, error) {
	return nil, r.service.Update(id, data.Book{Title: book.Title, Author: book.Author})
}
func (r *mutationResolver) DeleteBook(ctx context.Context, id int) (*bool, error) {
	return nil, r.service.Delete(id)
}

type queryResolver struct{ *Resolver }

func (r *queryResolver) Books(ctx context.Context) ([]*data.Book, error) {
	dto := []*data.Book{}
	books, err := r.service.List()
	for i := range books {
		dto = append(dto, &books[i])
	}
	return dto, err
}
func (r *queryResolver) Book(ctx context.Context, id int) (*data.Book, error) {
	book, err := r.service.Get(id)
	return &book, err
}
