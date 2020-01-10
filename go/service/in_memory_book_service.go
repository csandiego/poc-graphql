package service

import (
	"errors"
	"github.com/csandiego/poc-graphql/go/data"
	"sync"
)

var ErrNotFound = errors.New("Not found")

type InMemoryBookService struct {
	bookId int
	books  map[int]data.Book
	mutex  sync.Mutex
}

func NewInMemoryBookService() *InMemoryBookService {
	return &InMemoryBookService{bookId: 0, books: map[int]data.Book{}}
}

func (service *InMemoryBookService) Create(book data.Book) error {
	service.mutex.Lock()
	service.bookId += 1
	book.Id = service.bookId
	service.books[service.bookId] = book
	service.mutex.Unlock()
	return nil
}

func (service *InMemoryBookService) Delete(id int) error {
	service.mutex.Lock()
	delete(service.books, id)
	service.mutex.Unlock()
	return nil
}

func (service *InMemoryBookService) Get(id int) (data.Book, error) {
	var book data.Book
	var exists bool
	service.mutex.Lock()
	book, exists = service.books[id]
	service.mutex.Unlock()
	if !exists {
		return book, ErrNotFound
	}
	return book, nil
}

func (service *InMemoryBookService) List() ([]data.Book, error) {
	books := []data.Book{}
	service.mutex.Lock()
	for _, v := range service.books {
		books = append(books, v)
	}
	service.mutex.Unlock()
	return books, nil
}

func (service *InMemoryBookService) Update(id int, book data.Book) error {
	var err error = nil
	service.mutex.Lock()
	if _, exists := service.books[id]; exists {
		book.Id = id
		service.books[id] = book
	} else {
		err = ErrNotFound
	}
	service.mutex.Unlock()
	return err
}
