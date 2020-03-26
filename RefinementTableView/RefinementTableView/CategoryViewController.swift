//
//  CategoryViewController.swift
//  RefinementTableView
//
//  Created by home on 2020/03/10.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let categoryName = ["トップス", "ボトムス", "アウター"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.categoryName[indexPath.row]
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        // 前の画面に値を渡して戻る
        let refinementTableViewController = self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)! - 2] as! RefinementTableViewController
        refinementTableViewController.category = self.categoryName[indexPath.row]
        
        self.navigationController?.popViewController(animated: true)
    }
}
