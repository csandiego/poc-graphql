package com.github.csandiego.pocgrpahql.apollojvm.apollo

import com.apollographql.apollo.ApolloMutationCall
import com.apollographql.apollo.ApolloQueryCall
import com.apollographql.apollo.api.Mutation
import com.apollographql.apollo.api.Operation
import com.apollographql.apollo.api.Query

@Suppress("UNCHECKED_CAST")
class TestApolloClient : ApolloQueryCall.Factory, ApolloMutationCall.Factory {

    lateinit var query: Query<Operation.Data?, Any?, Operation.Variables?>
    var queryData: Any? = null
    lateinit var mutation: Mutation<Operation.Data?, Any?, Operation.Variables?>
    var mutationData: Any? = null

    override fun <D : Operation.Data?, T : Any?, V : Operation.Variables?> query(query: Query<D, T, V>): ApolloQueryCall<T> {
        this.query = query as Query<Operation.Data?, Any?, Operation.Variables?>
        return TestApolloQueryCall(query, queryData) as ApolloQueryCall<T>
    }

    override fun <D : Operation.Data?, T : Any?, V : Operation.Variables?> mutate(mutation: Mutation<D, T, V>): ApolloMutationCall<T> {
        this.mutation = mutation as Mutation<Operation.Data?, Any?, Operation.Variables?>
        return TestApolloMutationCall(mutation, mutationData) as ApolloMutationCall<T>
    }

    override fun <D : Operation.Data?, T : Any?, V : Operation.Variables?> mutate(mutation: Mutation<D, T, V>, withOptimisticUpdates: D): ApolloMutationCall<T> {
        this.mutation = mutation as Mutation<Operation.Data?, Any?, Operation.Variables?>
        return TestApolloMutationCall(mutation, mutationData) as ApolloMutationCall<T>
    }
}