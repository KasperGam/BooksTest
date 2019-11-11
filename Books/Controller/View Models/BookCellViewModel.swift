//
//  BookCellViewModel.swift
//  Books
//
//  Created by Kasper Gammeltoft on 11/5/19.
//  Copyright © 2019 Kasper Gammeltoft. All rights reserved.
//

import UIKit
import Combine

class BookCellViewModel {

    var title: String
    var author: String
    @Published var coverImage: UIImage?

    weak var listener: Listener?

    private var imageURL: URL?

    init(_ book: Book) {
        title = book.title
        author = book.author
        imageURL = book.imageURL

        downloadImage()
    }

    private func downloadImage() {
        guard let url = imageURL else { return }

        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, response, error in
            if let data = data,
                let image = UIImage(data: data) {
                self?.coverImage = image
            }
        }).resume()
    }
}
