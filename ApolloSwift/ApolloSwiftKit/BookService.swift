//
//  BookService.swift
//  ApolloSwift
//
//  Created by Christopher San Diego on 1/11/20.
//  Copyright © 2020 Christopher San Diego. All rights reserved.
//

public protocol BookService {
    
    func list(completion: @escaping (Result<[Book], Error>) -> Void)
    
    func create(book: Book, completion: @escaping (Result<Bool?, Error>) -> Void)
    
    func get(id: Int, completion: @escaping (Result<Book, Error>) -> Void)
    
    func update(id: Int, book: Book, completion: @escaping (Result<Bool?, Error>) -> Void)
    
    func delete(id: Int, completion: @escaping (Result<Bool?, Error>) -> Void)
    
}
