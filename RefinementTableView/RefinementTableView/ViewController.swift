//
//  ViewController.swift
//  RefinementTableView
//
//  Created by home on 2020/03/05.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var minPrice: UILabel!
    @IBOutlet weak var maxPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "RefinementTable", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RefinementTable") as! RefinementTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

