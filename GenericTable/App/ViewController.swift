//
//  ViewController.swift
//  GenericTable
//
//  Created by Turan Assylkhan on 9/30/20.
//  Copyright © 2020 Turan Assylkhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let users = [User(name: "John Doe", image: "waiting"), User(name: "Jane Roe", image: "waiting")]
    let employees = [Employee(name: "Richard Roe", position: "iOS dev."), Employee(name: "Jane Doe", position: "Android dev.")]
    
    lazy var strSection = SectionBuilder<String, StrCell>(items: ["Some", "String", "Text"])
    lazy var userSection = SectionBuilder<User, UserCell>(items: users)
    lazy var employeeSection = SectionBuilder<Employee, EmployeeCell>(items: employees)
    
    lazy var adapter = TableAdapter(list: [strSection, employeeSection, userSection])
//    lazy var adapter = TableAdapter()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), style: .grouped)
        tableView.estimatedRowHeight = 48
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        adapter += userSection
//        adapter += employeeSection
        
        view.addSubview(tableView)
        
        tableView.setAdapter(adapter)
        userSection.didSelected = { (model) in
            print(model)
        }
        employeeSection.didSelected = { (model) in
            print(model)
        }
    }
}
