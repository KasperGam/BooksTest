//
//  BookTableViewCell.swift
//  Books
//
//  Created by Kasper Gammeltoft on 11/5/19.
//  Copyright © 2019 Kasper Gammeltoft. All rights reserved.
//

import UIKit
import Combine

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    var imageSink: AnyCancellable?

    var viewModel: BookCellViewModel? {
        didSet {
            update()
        }
    }

    private func update() {
        imageSink?.cancel()
        imageSink = viewModel?.$coverImage.sink() { [weak self] image in
            DispatchQueue.main.async {
                self?.coverImageView.image = image
            }
        }

        coverImageView.image = viewModel?.coverImage
        titleLabel.text = viewModel?.title
        authorLabel.text = viewModel?.author
    }
}
