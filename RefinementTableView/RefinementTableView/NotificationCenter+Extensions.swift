//
//  NotificationCenter+Extensions.swift
//  RefinementTableView
//
//  Created by home on 2020/03/31.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let setCategory = Notification.Name("setCategory")
    
    static let setMinPrice = Notification.Name("setMinPrice")
    static let setMaxPrice = Notification.Name("setMaxPrice")
    
    static let tappedSearchButton = Notification.Name("tappedSearchButton")
    static let tappedClearButton = Notification.Name("tappedClearButton")
}
