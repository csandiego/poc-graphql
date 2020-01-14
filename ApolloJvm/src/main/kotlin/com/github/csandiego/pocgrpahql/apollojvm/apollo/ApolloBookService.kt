package com.github.csandiego.pocgrpahql.apollojvm.apollo


import com.apollographql.apollo.ApolloMutationCall
import com.apollographql.apollo.ApolloQueryCall
import com.apollographql.apollo.coroutines.toDeferred
import com.github.csandiego.pocgrpahql.apollojvm.*
import com.github.csandiego.pocgrpahql.apollojvm.data.Book
import com.github.csandiego.pocgrpahql.apollojvm.service.BookService
import com.github.csandiego.pocgrpahql.apollojvm.type.BookMutation

class ApolloBookService(private val queryCallFactory: ApolloQueryCall.Factory, private val mutationCallFactory: ApolloMutationCall.Factory) : BookService {

    override suspend fun list(): List<Book> {
        return queryCallFactory.query(BookListQuery()).toDeferred().await().data()!!.books.map {
            Book(it.id, it.title, it.author)
        }
    }

    override suspend fun get(id: Int): Book {
        return queryCallFactory.query(BookGetQuery(id)).toDeferred().await().data()!!.book.let {
            Book(it.id, it.title, it.author)
        }
    }

    override suspend fun create(book: Book) {
        mutationCallFactory.mutate(BookCreateMutation(BookMutation(book.title, book.author))).toDeferred().await()
    }

    override suspend fun update(id: Int, book: Book) {
        mutationCallFactory.mutate(BookUpdateMutation(id, BookMutation(book.title, book.author))).toDeferred().await()
    }

    override suspend fun delete(id: Int) {
        mutationCallFactory.mutate(BookDeleteMutation(id)).toDeferred().await()
    }
}