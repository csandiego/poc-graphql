//
//  ApolloBookService.swift
//  ApolloSwift
//
//  Created by Christopher San Diego on 1/11/20.
//  Copyright © 2020 Christopher San Diego. All rights reserved.
//

import Apollo
import Foundation

public class ApolloBookService: BookService {
    
    private let client: ApolloClientProtocol
    private let queue: DispatchQueue
    
    public init(client: ApolloClientProtocol, queue: DispatchQueue = .main) {
        self.client = client
        self.queue = queue
    }
    
    public func list(completion: @escaping (Result<[Book], Error>) -> Void) {
        _ = client.fetch(query: BookListQuery(), cachePolicy: .returnCacheDataElseFetch, context: nil, queue: queue) { result in
            switch result {
            case .success(let graphQLResult):
                completion(.success(graphQLResult.data!.books.map { dto in
                    Book(id: dto.id, title: dto.title, author: dto.author)
                }))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func create(book: Book, completion: @escaping (Result<Bool?, Error>) -> Void) {
        _ = client.perform(mutation: BookCreateMutation(book: BookMutation(title: book.title, author: book.author)), context: nil, queue: queue) { result in
            switch result {
            case .success(let graphQLResult):
                completion(.success(graphQLResult.data?.createBook))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func get(id: Int, completion: @escaping (Result<Book, Error>) -> Void) {
        _ = client.fetch(query: BookGetQuery(id: id), cachePolicy: .returnCacheDataElseFetch, context: nil, queue: queue) { result in
            switch result {
            case .success(let graphQLResult):
                let dto = graphQLResult.data!.book
                completion(.success(Book(id: dto.id, title: dto.title, author: dto.author)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func update(id: Int, book: Book, completion: @escaping (Result<Bool?, Error>) -> Void) {
        _ = client.perform(mutation: BookUpdateMutation(id: id, book: BookMutation(title: book.title, author: book.author)), context: nil, queue: queue) { result in
            switch result {
            case .success(let graphQLResult):
                completion(.success(graphQLResult.data?.updateBook))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func delete(id: Int, completion: @escaping (Result<Bool?, Error>) -> Void) {
        _ = client.perform(mutation: BookDeleteMutation(id: id), context: nil, queue: queue) { result in
            switch result {
            case .success(let graphQLResult):
                completion(.success(graphQLResult.data?.deleteBook))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
