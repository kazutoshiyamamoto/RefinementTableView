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
    
    private let sectionTitle = ["", "検索履歴"]
    private let searchMenuTitle = ["カテゴリからさがす", "ブランドからさがす"]
    private var searchHistory = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let searchHistory = UserDefaults.standard.stringArray(forKey: "searchHistory") {
            self.searchHistory = searchHistory
        }
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(SearchMenuViewController.refresh(sender:)), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
        
        self.tableView.tableFooterView = UIView()
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        self.searchHistory = []
        if let searchHistory = UserDefaults.standard.stringArray(forKey: "searchHistory") {
            self.searchHistory = searchHistory
        }
        self.tableView.reloadData()
        sender.endRefreshing()
    }
}

extension SearchMenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.searchMenuTitle.count
        } else {
            return self.searchHistory.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = self.searchMenuTitle[indexPath.row]
        } else {
            cell.textLabel?.text = !self.searchHistory.isEmpty ? self.searchHistory[indexPath.row] : ""
        }
        return cell
    }
}

extension SearchMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("選択された")
    }
}
