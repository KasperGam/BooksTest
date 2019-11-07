//
//  Library.swift
//  Books
//
//  Created by Kasper Gammeltoft on 11/4/19.
//  Copyright © 2019 Kasper Gammeltoft. All rights reserved.
//

import Foundation

protocol Library {
    var books: [Book] { get set }
}

class TestLibrary: Library {
    var books: [Book]

    init() {
        books = []

        guard
            let fileURL = Bundle.main.path(forResource: "books", ofType: "json"),
            let data = FileManager().contents(atPath: fileURL)
        else { print("Error getting json from books.json"); return }

        do {
            self.books = try JSONDecoder().decode([Book].self, from: data)
        } catch let error {
            print("Error decoding books: \(error.localizedDescription)")
        }
    }
}

class CurrentLibrary {
    static var library: Library = TestLibrary()
}
