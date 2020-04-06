//
//  ViewController.swift
//  RefinementTableView
//
//  Created by home on 2020/03/05.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchMenuView: UIView!
    
    private var searchController: UISearchController!
    
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var minPrice: UILabel!
    @IBOutlet weak var maxPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(type(of: self).setCondition(notification:)), name: .setCondition, object: nil)
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchBar.placeholder = "何かお探しですか"
        self.searchController.searchBar.delegate = self
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc func setCondition(notification: NSNotification?) {
        self.category.text = notification?.userInfo!["category"] as? String
        self.minPrice.text = notification?.userInfo!["minPrice"] as? String
        self.maxPrice.text = notification?.userInfo!["maxPrice"] as? String
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "RefinementTable", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RefinementTable") as! RefinementTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    // 検索バー選択時に検索メニュー画面を表示
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        UIView.animate(withDuration: 0.3, animations: {
            self.searchMenuView.alpha = 1.0
        })
        
        return true
    }
    
    // 検索バーのキャンセルボタンを選択時に検索メニューを非表示にする
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        UIView.animate(withDuration: 0.3, animations: {
            self.searchMenuView.alpha = 0.0
        })
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("検索実行")
    }
}

