//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct BookMutation: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(title: String, author: String) {
    graphQLMap = ["title": title, "author": author]
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var author: String {
    get {
      return graphQLMap["author"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "author")
    }
  }
}

public final class BookCreateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation BookCreate($book: BookMutation!) {
      createBook(book: $book)
    }
    """

  public let operationName = "BookCreate"

  public var book: BookMutation

  public init(book: BookMutation) {
    self.book = book
  }

  public var variables: GraphQLMap? {
    return ["book": book]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createBook", arguments: ["book": GraphQLVariable("book")], type: .scalar(Bool.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createBook: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createBook": createBook])
    }

    public var createBook: Bool? {
      get {
        return resultMap["createBook"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "createBook")
      }
    }
  }
}

public final class BookDeleteMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation BookDelete($id: Int!) {
      deleteBook(id: $id)
    }
    """

  public let operationName = "BookDelete"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteBook", arguments: ["id": GraphQLVariable("id")], type: .scalar(Bool.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteBook: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteBook": deleteBook])
    }

    public var deleteBook: Bool? {
      get {
        return resultMap["deleteBook"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "deleteBook")
      }
    }
  }
}

public final class BookGetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query BookGet($id: Int!) {
      book(id: $id) {
        __typename
        id
        title
        author
      }
    }
    """

  public let operationName = "BookGet"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("book", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Book.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(book: Book) {
      self.init(unsafeResultMap: ["__typename": "Query", "book": book.resultMap])
    }

    public var book: Book {
      get {
        return Book(unsafeResultMap: resultMap["book"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "book")
      }
    }

    public struct Book: GraphQLSelectionSet {
      public static let possibleTypes = ["Book"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("author", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: String, author: String) {
        self.init(unsafeResultMap: ["__typename": "Book", "id": id, "title": title, "author": author])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var author: String {
        get {
          return resultMap["author"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "author")
        }
      }
    }
  }
}

public final class BookListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query BookList {
      books {
        __typename
        id
        title
        author
      }
    }
    """

  public let operationName = "BookList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("books", type: .nonNull(.list(.nonNull(.object(Book.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(books: [Book]) {
      self.init(unsafeResultMap: ["__typename": "Query", "books": books.map { (value: Book) -> ResultMap in value.resultMap }])
    }

    public var books: [Book] {
      get {
        return (resultMap["books"] as! [ResultMap]).map { (value: ResultMap) -> Book in Book(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Book) -> ResultMap in value.resultMap }, forKey: "books")
      }
    }

    public struct Book: GraphQLSelectionSet {
      public static let possibleTypes = ["Book"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("author", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: String, author: String) {
        self.init(unsafeResultMap: ["__typename": "Book", "id": id, "title": title, "author": author])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var author: String {
        get {
          return resultMap["author"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "author")
        }
      }
    }
  }
}

public final class BookUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation BookUpdate($id: Int!, $book: BookMutation!) {
      updateBook(id: $id, book: $book)
    }
    """

  public let operationName = "BookUpdate"

  public var id: Int
  public var book: BookMutation

  public init(id: Int, book: BookMutation) {
    self.id = id
    self.book = book
  }

  public var variables: GraphQLMap? {
    return ["id": id, "book": book]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateBook", arguments: ["id": GraphQLVariable("id"), "book": GraphQLVariable("book")], type: .scalar(Bool.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateBook: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateBook": updateBook])
    }

    public var updateBook: Bool? {
      get {
        return resultMap["updateBook"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "updateBook")
      }
    }
  }
}
