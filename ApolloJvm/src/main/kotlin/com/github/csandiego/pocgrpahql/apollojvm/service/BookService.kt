package com.github.csandiego.pocgrpahql.apollojvm.service

import com.github.csandiego.pocgrpahql.apollojvm.data.Book

interface BookService {

    suspend fun list(): List<Book>

    suspend fun get(id: Int): Book

    suspend fun create(book: Book)

    suspend fun update(id: Int, book: Book)

    suspend fun delete(id: Int)
}