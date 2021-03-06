/*
 * This Kotlin source file was generated by the Gradle 'init' task.
 */
package com.github.csandiego.pocgrpahql.apollojvm

import com.apollographql.apollo.ApolloClient
import com.github.csandiego.pocgrpahql.apollojvm.apollo.ApolloBookService
import com.github.csandiego.pocgrpahql.apollojvm.data.Book
import kotlinx.coroutines.runBlocking
import okhttp3.OkHttpClient
import kotlin.system.exitProcess

fun main(args: Array<String>) = runBlocking<Unit> {
    if (args.isEmpty()) {
        println("Insufficient arguments.")
        exitProcess(1)
    }
    val client = ApolloClient.builder()
            .serverUrl("http://localhost/graphql")
            .okHttpClient(OkHttpClient.Builder().build())
            .build()
    val service = ApolloBookService(client, client)
    when (args[0]) {
        "list" -> println(service.list())
        "create" -> {
            if (args.size != 3) {
                println("Wrong number of arguments for create.")
                exitProcess(1)
            }
            service.create(Book(null, args[1], args[2]))
        }
        "get" -> {
            if (args.size != 2) {
                println("Wrong number of arguments for get")
                exitProcess(1)
            }
            println(service.get(args[1].toInt()))
        }
        "update" -> {
            if (args.size != 4) {
                println("Wrong number of arguments for update.")
                exitProcess(1)
            }
            service.update(args[1].toInt(), Book(null, args[2], args[3]))
        }
        "delete" -> {
            if (args.size != 2) {
                println("Wrong number of arguments for delete")
                exitProcess(1)
            }
            service.delete(args[1].toInt())
        }
        else -> println("Unsupported operation.")
    }
    exitProcess(0)
}
