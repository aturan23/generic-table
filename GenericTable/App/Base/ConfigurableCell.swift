//
//  ConfigurableCell.swift
//  GenericTable
//
//  Created by Turan Assylkhan on 10/1/20.
//  Copyright © 2020 Turan Assylkhan. All rights reserved.
//

import UIKit

typealias ConfigurableCell = UITableViewCell & Configurable

protocol Configurable {
    associatedtype Item
    
    func configure(with _: Item)
}
