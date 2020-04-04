//
//  ViewController.swift
//  RefinementTableView
//
//  Created by home on 2020/03/05.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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

