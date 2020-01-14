package com.github.csandiego.pocgrpahql.apollojvm.apollo

import com.github.csandiego.pocgrpahql.apollojvm.*
import com.github.csandiego.pocgrpahql.apollojvm.data.Book
import kotlinx.coroutines.runBlocking
import org.junit.Before
import org.junit.Test
import kotlin.test.assertEquals

class ApolloBookServiceTest {

    private lateinit var client: TestApolloClient
    private lateinit var service: ApolloBookService

    @Before
    fun setUp() {
        client = TestApolloClient()
        service = ApolloBookService(client, client)
    }

    @Test
    fun list() = runBlocking {
        val dto = listOf(BookListQuery.Book("Book", 1, "abc", "xyz"))
        client.queryData = BookListQuery.Data(dto)
        val books = service.list()
        assertEquals(dto[0].id, books[0].id)
        assertEquals(dto[0].title, books[0].title)
        assertEquals(dto[0].author, books[0].author)
    }

    @Test
    fun get() = runBlocking {
        val id = 1
        val dto = BookGetQuery.Book("Book", id, "abc", "xyz")
        client.queryData = BookGetQuery.Data(dto)
        val book = service.get(id)
        assertEquals(id, (client.query as BookGetQuery).id)
        assertEquals(dto.id, book.id)
        assertEquals(dto.title, book.title)
        assertEquals(dto.author, book.author)
    }

    @Test
    fun create() = runBlocking {
        val book = Book(null, "abc", "xyz")
        client.mutationData = BookCreateMutation.Data(null)
        service.create(book)
        assertEquals(book.title, (client.mutation as BookCreateMutation).book.title)
        assertEquals(book.author, (client.mutation as BookCreateMutation).book.author)
    }

    @Test
    fun update() = runBlocking {
        val id = 1
        val book = Book(null, "abc", "xyz")
        client.mutationData = BookUpdateMutation.Data(null)
        service.update(id, book)
        assertEquals(id, (client.mutation as BookUpdateMutation).id)
        assertEquals(book.title, (client.mutation as BookUpdateMutation).book.title)
        assertEquals(book.author, (client.mutation as BookUpdateMutation).book.author)
    }

    @Test
    fun delete() = runBlocking {
        val id = 1
        client.mutationData = BookDeleteMutation.Data(null)
        service.delete(id)
        assertEquals(id, (client.mutation as BookDeleteMutation).id)
    }
}