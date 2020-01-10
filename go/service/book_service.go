package service

import (
	"github.com/csandiego/poc-graphql/go/data"
)

type BookService interface {
	Create(data.Book) error
	Delete(int) error
	Get(int) (data.Book, error)
	List() ([]data.Book, error)
	Update(int, data.Book) error
}
