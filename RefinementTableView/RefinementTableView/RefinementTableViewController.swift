//
//  RefinementTableViewController.swift
//  RefinementTableView
//
//  Created by home on 2020/03/06.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import UIKit

class RefinementTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let refinementMenuTitle = ["カテゴリ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        self.tableView.tableFooterView = UIView()
    }
}

extension RefinementTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.refinementMenuTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.RefinementConditionTitle.text = self.refinementMenuTitle[indexPath.row]
        return cell
    }
}

extension RefinementTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

