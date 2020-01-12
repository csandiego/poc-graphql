//
//  main.swift
//  ApolloSwift
//
//  Created by Christopher San Diego on 1/11/20.
//  Copyright © 2020 Christopher San Diego. All rights reserved.
//

import Apollo
import ApolloSwiftKit
import Foundation

if CommandLine.argc < 2 {
    print("Insufficient arguments.")
    exit(EXIT_FAILURE)
}

let client = ApolloClient(url: URL(string: "http://localhost/graphql")!)
let service = ApolloBookService(client: client, queue: .global(qos: .default))

switch CommandLine.arguments[1] {
case "list":
    let group = DispatchGroup()
    group.enter()
    service.list { result in
        switch result {
        case .success(let books):
            print(books)
        case .failure(let error):
            print(error)
        }
        group.leave()
    }
    group.wait()
case "create":
    if CommandLine.argc != 4 {
        print("Wrong number of arguments for create.")
        exit(EXIT_FAILURE)
    }
    let group = DispatchGroup()
    group.enter()
    service.create(book: Book(id: nil, title: CommandLine.arguments[2], author: CommandLine.arguments[3])) { result in
        switch result {
        case .failure(let error):
            print(error)
        default:
            break
        }
        group.leave()
    }
    group.wait()
case "get":
    if CommandLine.argc != 3 {
        print("Wrong number of arguments for get.")
        exit(EXIT_FAILURE)
    }
    let group = DispatchGroup()
    group.enter()
    let id = Int(CommandLine.arguments[2])!
    service.get(id: id) { result in
        switch result {
        case .success(let book):
            print(book)
        case .failure(let error):
            print(error)
        }
        group.leave()
    }
    group.wait()
case "update":
    if CommandLine.argc != 5 {
        print("Wrong number of arguments for update.")
        exit(EXIT_FAILURE)
    }
    let group = DispatchGroup()
    group.enter()
    let id = Int(CommandLine.arguments[2])!
    service.update(id: id, book: Book(id: nil, title: CommandLine.arguments[3], author: CommandLine.arguments[4])) { result in
        switch result {
        case .failure(let error):
            print(error)
        default:
            break
        }
        group.leave()
    }
    group.wait()
case "delete":
    if CommandLine.argc != 3 {
        print("Wrong number of arguments for delete.")
        exit(EXIT_FAILURE)
    }
    let group = DispatchGroup()
    group.enter()
    let id = Int(CommandLine.arguments[2])!
    service.delete(id: id) { result in
        switch result {
        case .failure(let error):
            print(error)
        default:
            break
        }
        group.leave()
    }
    group.wait()
default:
    print("Unsupported operation.")
}
