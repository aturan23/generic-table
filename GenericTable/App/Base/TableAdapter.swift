//
//  TableDirector.swift
//  GenericTable
//
//  Created by Turan Assylkhan on 10/1/20.
//  Copyright © 2020 Turan Assylkhan. All rights reserved.
//

import UIKit

class TableAdapter: NSObject {
    var sectionList: [Section] = []

    init(list: [Section]) {
        sectionList = list
    }
}

extension TableAdapter: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionList.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionList[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sectionList[indexPath.section]
        return section.cell(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = sectionList[indexPath.section]
        section.didSelect(at: indexPath.row)
    }
}

func +=(left: TableAdapter, right: Section) {
    left.sectionList.append(right)
}
