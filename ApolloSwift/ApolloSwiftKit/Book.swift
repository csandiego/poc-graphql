//
//  Book.swift
//  ApolloSwift
//
//  Created by Christopher San Diego on 1/11/20.
//  Copyright © 2020 Christopher San Diego. All rights reserved.
//

public struct Book {
    
    public let id: Int?
    public let title: String
    public let author: String
    
    public init(id: Int?, title: String, author: String) {
        self.id = id
        self.title = title
        self.author = author
    }
    
}
