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
    
    var category = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.tableView.register(UINib(nibName: "PriceCell", bundle: nil), forCellReuseIdentifier: "PriceCell")
        
        self.tableView.tableFooterView = UIView()
    }
}

extension RefinementTableViewController: UITableViewDataSource {
    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.refinementMenuTitle.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.RefinementConditionTitle.text = self.refinementMenuTitle[indexPath.row]
            cell.RefinementCondition.text = self.category
            
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath) as! PriceCell
            // セル選択アニメーションを表示しない
            cell.selectionStyle = .none
            
            return cell
        }
    }
}

extension RefinementTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            self.tableView.deselectRow(at: indexPath, animated: true)
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Category", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Category") as! CategoryViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

