//
//  BooksViewController.swift
//  Books
//
//  Created by Kasper Gammeltoft on 11/4/19.
//  Copyright © 2019 Kasper Gammeltoft. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private lazy var library: Library = CurrentLibrary.library

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = .blue
        self.navigationItem.title = "The Best Books"
        tableView.dataSource = self
        tableView.rowHeight = 80.0
    }
}

extension BooksViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "booksCell") as! BookTableViewCell
        let bookViewModel = BookCellViewModel(library.books[indexPath.row])
        cell.viewModel = bookViewModel

        return cell
    }
}
