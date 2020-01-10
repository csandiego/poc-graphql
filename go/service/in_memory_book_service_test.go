package service

import (
	"github.com/csandiego/poc-graphql/go/data"
	"github.com/stretchr/testify/require"
	"testing"
)

func TestAll(t *testing.T) {
	service := NewInMemoryBookService()
	book := data.Book{Title: "abc", Author: "def"}
	err := service.Create(book)
	require.Nil(t, err)
	books, err := service.List()
	require.Nil(t, err)
	require.Equal(t, 1, len(books))
	require.Equal(t, book.Title, books[0].Title)
	require.Equal(t, book.Author, books[0].Author)
	id := books[0].Id
	book, err = service.Get(id)
	require.Nil(t, err)
	require.Equal(t, books[0].Id, book.Id)
	require.Equal(t, books[0].Title, book.Title)
	require.Equal(t, books[0].Author, book.Author)
	edited := data.Book{Title: "ghi", Author: "jkl"}
	err = service.Update(id, edited)
	require.Nil(t, err)
	book, err = service.Get(id)
	require.Nil(t, err)
	require.Equal(t, edited.Title, book.Title)
	require.Equal(t, edited.Author, book.Author)
	err = service.Delete(id)
	require.Nil(t, err)
	books, err = service.List()
	require.Nil(t, err)
	require.Equal(t, 0, len(books))
}
