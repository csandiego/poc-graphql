package com.github.csandiego.pocgrpahql.apollojvm.apollo

import com.apollographql.apollo.ApolloCall
import com.apollographql.apollo.ApolloMutationCall
import com.apollographql.apollo.api.Operation
import com.apollographql.apollo.api.OperationName
import com.apollographql.apollo.api.Query
import com.apollographql.apollo.api.Response
import com.apollographql.apollo.cache.CacheHeaders
import com.apollographql.apollo.request.RequestHeaders

class TestApolloMutationCall<T>(private val operation: Operation<*, *, *>, private val data: T) : ApolloMutationCall<T> {

    override fun enqueue(callback: ApolloCall.Callback<T>?) {
        callback?.onResponse(Response.builder<T>(operation).data(data).build())
    }

    override fun operation(): Operation<*, *, *> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun cancel() {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun clone(): ApolloMutationCall<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun cacheHeaders(cacheHeaders: CacheHeaders): ApolloMutationCall<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun refetchQueries(vararg operationNames: OperationName?): ApolloMutationCall<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun refetchQueries(vararg queries: Query<*, *, *>?): ApolloMutationCall<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun requestHeaders(requestHeaders: RequestHeaders): ApolloMutationCall<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun isCanceled(): Boolean {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }
}