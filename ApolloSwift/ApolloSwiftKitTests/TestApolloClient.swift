//
//  TestApolloClient.swift
//  ApolloSwiftKitTests
//
//  Created by Christopher San Diego on 1/12/20.
//  Copyright © 2020 Christopher San Diego. All rights reserved.
//

import Apollo
import Foundation

class TestApolloClient: ApolloClientProtocol, Cancellable {
    
    var store: ApolloStore {
        get {
            fatalError()
        }
        set(value) {
            fatalError()
        }
    }
    
    var cacheKeyForObject: CacheKeyForObject? = nil
    
    func clearCache(callbackQueue: DispatchQueue, completion: ((Result<Void, Error>) -> Void)?) {
    }
        
    func fetch<Query>(query: Query, cachePolicy: CachePolicy, context: UnsafeMutableRawPointer?, queue: DispatchQueue, resultHandler: ((Result<GraphQLResult<Query.Data>, Error>) -> Void)?) -> Cancellable where Query : GraphQLQuery {
        return self
    }
    
    func watch<Query>(query: Query, cachePolicy: CachePolicy, queue: DispatchQueue, resultHandler: @escaping (Result<GraphQLResult<Query.Data>, Error>) -> Void) -> GraphQLQueryWatcher<Query> where Query : GraphQLQuery {
        return GraphQLQueryWatcher(client: self, query: query, resultHandler: resultHandler)
    }
    
    func perform<Mutation>(mutation: Mutation, context: UnsafeMutableRawPointer?, queue: DispatchQueue, resultHandler: ((Result<GraphQLResult<Mutation.Data>, Error>) -> Void)?) -> Cancellable where Mutation : GraphQLMutation {
        return self
    }
    
    func upload<Operation>(operation: Operation, context: UnsafeMutableRawPointer?, files: [GraphQLFile], queue: DispatchQueue, resultHandler: ((Result<GraphQLResult<Operation.Data>, Error>) -> Void)?) -> Cancellable where Operation : GraphQLOperation {
        return self
    }
    
    func subscribe<Subscription>(subscription: Subscription, queue: DispatchQueue, resultHandler: @escaping (Result<GraphQLResult<Subscription.Data>, Error>) -> Void) -> Cancellable where Subscription : GraphQLSubscription {
        return self
    }
    
    func cancel() {
    }
    
}
