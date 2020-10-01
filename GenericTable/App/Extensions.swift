//
//  Extensions.swift
//  GenericTable
//
//  Created by Turan Assylkhan on 9/30/20.
//  Copyright © 2020 Turan Assylkhan. All rights reserved.
//

import UIKit

extension UITableView {
    func setAdapter(_ adapter: TableAdapter) {
        dataSource = adapter
        delegate = adapter
        reloadData()
    }
}
