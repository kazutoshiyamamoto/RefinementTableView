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
    private var minPrice = ""
    private var maxPrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.tableView.register(UINib(nibName: "PriceCell", bundle: nil), forCellReuseIdentifier: "PriceCell")
        self.tableView.register(UINib(nibName: "RunCell", bundle: nil), forCellReuseIdentifier: "RunCell")
        
        self.tableView.tableFooterView = UIView()
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(type(of: self).setMinPrice(notification:)), name: .setMinPrice, object: nil)
        center.addObserver(self, selector: #selector(type(of: self).setMaxPrice(notification:)), name: .setMaxPrice, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // カテゴリ選択画面から戻ってきた時にセルを更新して選択したカテゴリを表示
        // TODO:戻ってきた時のみリロードするよう変更が必要
        self.tableView.reloadData()
    }
    
    @objc func setMinPrice(notification: NSNotification?) {
        self.minPrice = notification?.userInfo!["minPrice"] as! String
    }
    
    @objc func setMaxPrice(notification: NSNotification?) {
        self.maxPrice = notification?.userInfo!["maxPrice"] as! String
    }
}

extension RefinementTableViewController: UITableViewDataSource {
    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
            
        } else if indexPath.section == 1 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath) as! PriceCell
            // セル選択アニメーションを表示しない
            cell.selectionStyle = .none
            
            return cell
            
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "RunCell", for: indexPath) as! RunCell
            cell.clearButton.layer.borderWidth = 0.5
            cell.clearButton.layer.borderColor = UIColor.red.cgColor
            cell.clearButton.layer.cornerRadius = 5
            cell.searchButton.layer.cornerRadius = 5
            // セル選択アニメーションを表示しない
            cell.selectionStyle = .none
            
            cell.searchButtonDelegate = self
            cell.clearButtonDelegate = self
            
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

extension RefinementTableViewController: SearchButtonDelegate {
    func tappedSearchButton() {
        print("検索が押された")
        
        print("\(self.category)")
        print("\(self.minPrice)")
        print("\(self.maxPrice)")
    }
}

extension RefinementTableViewController: ClearButtonDelegate {
    func tappedClearButton() {
        self.category = ""
        self.minPrice = ""
        self.maxPrice = ""
    }
}

