//
//  BookTableViewCell.swift
//  Books
//
//  Created by Kasper Gammeltoft on 11/5/19.
//  Copyright © 2019 Kasper Gammeltoft. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    var viewModel: BookCellViewModel? {
        didSet {
            viewModel?.listener = self
            update()
        }
    }

    private func update() {
        coverImageView.image = viewModel?.coverImage
        titleLabel.text = viewModel?.title
        authorLabel.text = viewModel?.author
    }
}

extension BookTableViewCell: Listener {
    func notify() {
        DispatchQueue.main.async {
            self.update()
        }
    }
}
