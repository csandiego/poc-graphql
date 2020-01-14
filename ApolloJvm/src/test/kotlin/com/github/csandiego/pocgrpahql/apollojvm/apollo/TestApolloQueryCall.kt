package com.github.csandiego.pocgrpahql.apollojvm.apollo

import com.apollographql.apollo.ApolloCall
import com.apollographql.apollo.ApolloQueryCall
import com.apollographql.apollo.ApolloQueryWatcher
import com.apollographql.apollo.api.Operation
import com.apollographql.apollo.api.Response
import com.apollographql.apollo.api.cache.http.HttpCachePolicy
import com.apollographql.apollo.cache.CacheHeaders
import com.apollographql.apollo.fetcher.ResponseFetcher
import com.apollographql.apollo.request.RequestHeaders

class TestApolloQueryCall<T>(private val operation: Operation<*, *, *>, private val data: T) : ApolloQueryCall<T> {

    override fun enqueue(callback: ApolloCall.Callback<T>?) {
        callback?.onResponse(Response.builder<T>(operation).data(data).build())
    }

    override fun httpCachePolicy(httpCachePolicy: HttpCachePolicy.Policy): ApolloQueryCall<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun operation(): Operation<*, *, *> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun cancel() {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun clone(): ApolloQueryCall<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun isCanceled(): Boolean {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun watcher(): ApolloQueryWatcher<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun responseFetcher(fetcher: ResponseFetcher): ApolloQueryCall<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun cacheHeaders(cacheHeaders: CacheHeaders): ApolloQueryCall<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun requestHeaders(requestHeaders: RequestHeaders): ApolloQueryCall<T> {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }
}