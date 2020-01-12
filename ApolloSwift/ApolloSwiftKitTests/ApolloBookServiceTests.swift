//
//  ApolloBookServiceTests.swift
//  ApolloSwiftTests
//
//  Created by Christopher San Diego on 1/12/20.
//  Copyright © 2020 Christopher San Diego. All rights reserved.
//

import XCTest
import Apollo
import ApolloSwiftKit

class ApolloBookServiceTests: XCTestCase {
    
    override func setUp() {
    }
    
    func testList() {
        class BookListQueryClient: TestApolloClient {
            
            let books: [BookListQuery.Data.Book]
            
            init(books: [BookListQuery.Data.Book]) {
                self.books = books
            }
            
            override func fetch<Query>(query: Query, cachePolicy: CachePolicy, context: UnsafeMutableRawPointer?, queue: DispatchQueue, resultHandler: ((Result<GraphQLResult<Query.Data>, Error>) -> Void)?) -> Cancellable where Query : GraphQLQuery {
                let result = Result<GraphQLResult<BookListQuery.Data>, Error>.success(GraphQLResult(data: BookListQuery.Data(books: books), errors: nil, source: .server, dependentKeys: nil))
                resultHandler?(result as! Result<GraphQLResult<Query.Data>, Error>)
                return self
            }
            
        }
        let dto = [BookListQuery.Data.Book(id: 1, title: "abc", author: "xyz")]
        let client = BookListQueryClient(books: dto)
        let service = ApolloBookService(client: client)
        let expectation = self.expectation(description: "Callback")
        service.list { result in
            switch result {
            case .success(let books):
                XCTAssertEqual(dto[0].id, books[0].id)
                XCTAssertEqual(dto[0].title, books[0].title)
                XCTAssertEqual(dto[0].author, books[0].author)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testGet() {
        class BookGetQueryClient: TestApolloClient {
            
            var query: BookGetQuery!
            let book: BookGetQuery.Data.Book
            
            init(book: BookGetQuery.Data.Book) {
                self.book = book
            }
            
            override func fetch<Query>(query: Query, cachePolicy: CachePolicy, context: UnsafeMutableRawPointer?, queue: DispatchQueue, resultHandler: ((Result<GraphQLResult<Query.Data>, Error>) -> Void)?) -> Cancellable where Query : GraphQLQuery {
                self.query = query as? BookGetQuery
                let result = Result<GraphQLResult<BookGetQuery.Data>, Error>.success(GraphQLResult(data: BookGetQuery.Data(book: book), errors: nil, source: .server, dependentKeys: nil))
                resultHandler?(result as! Result<GraphQLResult<Query.Data>, Error>)
                return self
            }
            
        }
        let id = 1
        let dto = BookGetQuery.Data.Book(id: id, title: "abc", author: "xyz")
        let client = BookGetQueryClient(book: dto)
        let service = ApolloBookService(client: client)
        let expectation = self.expectation(description: "Callback")
        service.get(id: id) { result in
            switch result {
            case .success(let book):
                XCTAssertEqual(id, client.query.id)
                XCTAssertEqual(dto.id, book.id)
                XCTAssertEqual(dto.title, book.title)
                XCTAssertEqual(dto.author, book.author)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testCreate() {
        class BookCreateMutationClient: TestApolloClient {
            
            var mutation: BookCreateMutation!
            
            override func perform<Mutation>(mutation: Mutation, context: UnsafeMutableRawPointer?, queue: DispatchQueue, resultHandler: ((Result<GraphQLResult<Mutation.Data>, Error>) -> Void)?) -> Cancellable where Mutation : GraphQLMutation {
                self.mutation = mutation as? BookCreateMutation
                let result = Result<GraphQLResult<BookCreateMutation.Data>, Error>.success(GraphQLResult(data: BookCreateMutation.Data(), errors: nil, source: .server, dependentKeys: nil))
                resultHandler?(result as! Result<GraphQLResult<Mutation.Data>, Error>)
                return self
            }
            
        }
        let client = BookCreateMutationClient()
        let service = ApolloBookService(client: client)
        let book = Book(id: nil, title: "abc", author: "xyz")
        let expectation = self.expectation(description: "Callback")
        service.create(book: book) { result in
            switch result {
            case .success:
                XCTAssertEqual(book.title, client.mutation.book.title)
                XCTAssertEqual(book.author, client.mutation.book.author)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testUpdate() {
        class BookUpdateMutationClient: TestApolloClient {
            
            var mutation: BookUpdateMutation!
            
            override func perform<Mutation>(mutation: Mutation, context: UnsafeMutableRawPointer?, queue: DispatchQueue, resultHandler: ((Result<GraphQLResult<Mutation.Data>, Error>) -> Void)?) -> Cancellable where Mutation : GraphQLMutation {
                self.mutation = mutation as? BookUpdateMutation
                let result = Result<GraphQLResult<BookUpdateMutation.Data>, Error>.success(GraphQLResult(data: BookUpdateMutation.Data(), errors: nil, source: .server, dependentKeys: nil))
                resultHandler?(result as! Result<GraphQLResult<Mutation.Data>, Error>)
                return self
            }
            
        }
        let client = BookUpdateMutationClient()
        let service = ApolloBookService(client: client)
        let id = 1
        let book = Book(id: nil, title: "abc", author: "xyz")
        let expectation = self.expectation(description: "Callback")
        service.update(id: id, book: book) { result in
            switch result {
            case .success:
                XCTAssertEqual(id, client.mutation.id)
                XCTAssertEqual(book.title, client.mutation.book.title)
                XCTAssertEqual(book.author, client.mutation.book.author)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testDelete() {
        class BookDeleteMutationClient: TestApolloClient {
            
            var mutation: BookDeleteMutation!
            
            override func perform<Mutation>(mutation: Mutation, context: UnsafeMutableRawPointer?, queue: DispatchQueue, resultHandler: ((Result<GraphQLResult<Mutation.Data>, Error>) -> Void)?) -> Cancellable where Mutation : GraphQLMutation {
                self.mutation = mutation as? BookDeleteMutation
                let result = Result<GraphQLResult<BookDeleteMutation.Data>, Error>.success(GraphQLResult(data: BookDeleteMutation.Data(), errors: nil, source: .server, dependentKeys: nil))
                resultHandler?(result as! Result<GraphQLResult<Mutation.Data>, Error>)
                return self
            }
            
        }
        let client = BookDeleteMutationClient()
        let service = ApolloBookService(client: client)
        let id = 1
        let expectation = self.expectation(description: "Callback")
        service.delete(id: id) { result in
            switch result {
            case .success:
                XCTAssertEqual(id, client.mutation.id)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

}
