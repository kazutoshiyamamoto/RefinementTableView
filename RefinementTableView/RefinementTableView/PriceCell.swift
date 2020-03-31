//
//  PriceCell.swift
//  RefinementTableView
//
//  Created by home on 2020/03/11.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import UIKit

class PriceCell: UITableViewCell {
    
    @IBOutlet weak var minPrice: UITextField!
    @IBOutlet weak var maxPrice: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setDoneToolbar(field: self.minPrice)
        self.setDoneToolbar(field: self.maxPrice)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // Editing Changedで呼び出される
    @IBAction func editMinPrice(_ sender: UITextField) {
        let center = NotificationCenter.default
        center.post(name: .setMinPrice, object: nil, userInfo: ["minPrice": self.minPrice.text ?? ""])
    }
    
    // Editing Changedで呼び出される
    @IBAction func editMaxPrice(_ sender: UITextField) {
        let center = NotificationCenter.default
        center.post(name: .setMaxPrice, object: nil, userInfo: ["maxPrice": self.maxPrice.text ?? ""])
    }
    
    private func setDoneToolbar(field: UITextField) {
        // サイズ指定しないとレイアウト制約でコンフリクトする
        // 参考:https://forums.developer.apple.com/thread/121474
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        // 完了ボタン選択時にキーボードを閉じるメソッドを呼び出す
        doneToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "完了", style: UIBarButtonItem.Style.done, target: self, action: #selector(PriceCell.tappedDoneButton))
        ]
        
        doneToolbar.sizeToFit()
        field.inputAccessoryView = doneToolbar
    }
    
    // キーボードを閉じる
    @objc private func tappedDoneButton() {
        self.minPrice.resignFirstResponder()
        self.maxPrice.resignFirstResponder()
    }
}


