//
//  SectionBuilder.swift
//  GenericTable
//
//  Created by Turan Assylkhan on 10/1/20.
//  Copyright © 2020 Turan Assylkhan. All rights reserved.
//

import UIKit

protocol Section {
    var count: Int { get }
    func cell(at index: Int) -> UITableViewCell
    func didSelect(at index: Int)
}

class SectionBuilder<Item, Cell: ConfigurableCell>: Section where Cell.Item == Item {
    
    private let items: [Item]
    private lazy var cells: [Cell] = self.createCells()
    var didSelected: ((Item) -> ())?

    var count: Int {
        items.count
    }

    init(items: [Item]) {
        self.items = items
    }

    func cell(at index: Int) -> UITableViewCell {
        cells[index]
    }

    func didSelect(at index: Int) {
        let item = items[index]
        didSelected?(item)
    }

    func createCells() -> [Cell] {
        return items.map { item in
            let cell = Cell()
            cell.configure(with: item)
            return cell
        }
    }
}
