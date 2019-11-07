//
//  Book.swift
//  Books
//
//  Created by Kasper Gammeltoft on 11/4/19.
//  Copyright © 2019 Kasper Gammeltoft. All rights reserved.
//

import Foundation

struct Book: Decodable {
    var title: String
    var author: String
    var pages: Int
    var language: Language
    var country: String
    var year: Int

    private var imageLink: String
    private var link: String

    var imageURL: URL? {
        return URL(string: imageLink)
    }
    var sourceURL: URL? {
        return URL(string: link)
    }
}

extension Book {
    enum Language: String, Decodable {
        case English
        case Spanish
        case French
        case German
        case Russian
        case Italian
        case Danish
        case Old_Norse = "Old Norse"
        case Akkadian
        case Hebrew
        case Arabic
        case Greek
        case Portuguese
        case Norwegian
        case Sanskrit
        case Japanese
        case Icelandic
        case Swedish
        case Chinese
        case Latin = "Classical Latin"
        case Persian

        case unknown

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let stringValue = try container.decode(String.self)

            self = Language(rawValue: stringValue) ?? Language.unknown
        }
    }
}
