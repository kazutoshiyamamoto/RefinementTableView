//
//  SearchMenuViewController.swift
//  RefinementTableView
//
//  Created by home on 2020/04/06.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import UIKit

class SearchMenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let searchMenuName = ["カテゴリからさがす", "ブランドからさがす"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
    }
}

extension SearchMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchMenuName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.searchMenuName[indexPath.row]
        return cell
    }
}

extension SearchMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("選択された")
    }
}
