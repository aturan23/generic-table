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
    typealias CellClosure = (Item) -> ()

    private let items: [Item]
    private lazy var cells: [Cell] = self.createCells()
    var didSelected: CellClosure? = nil

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
        let m = items[index]
        didSelected?(m)
    }

    func createCells() -> [Cell] {
        return items.map { m in
            let c = Cell()
            c.configure(with: m)
            return c
        }
    }
}
