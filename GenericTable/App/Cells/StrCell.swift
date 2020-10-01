//
//  StrCell.swift
//  GenericTable
//
//  Created by Turan Assylkhan on 10/1/20.
//  Copyright © 2020 Turan Assylkhan. All rights reserved.
//

import UIKit

class StrCell: ConfigurableCell {
    
    func configure(with text: String) {
        textLabel?.text = text
    }
}
