//
//  UserCell.swift
//  GenericTable
//
//  Created by Turan Assylkhan on 10/1/20.
//  Copyright © 2020 Turan Assylkhan. All rights reserved.
//

import UIKit

class UserCell: ConfigurableCell {
    
    func configure(with user: User) {
        textLabel?.text = user.name
    }
}
