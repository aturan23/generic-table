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

class SectionBuilder<Model, Cell>: Section where Cell: ConfigurableCell, Cell.Model == Model {
    typealias CellClosure = (Model) -> ()

    private let items: [Model]
    private lazy var cells: [Cell] = self.createCells()
    var didSelected: CellClosure? = nil

    var count: Int {
        items.count
    }

    init(items: [Model]) {
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
