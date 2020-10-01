//
//  EmployeeCell.swift
//  GenericTable
//
//  Created by Turan Assylkhan on 10/1/20.
//  Copyright © 2020 Turan Assylkhan. All rights reserved.
//

import UIKit

class EmployeeCell: ConfigurableCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with employee: Employee) {
        titleLabel.text = employee.name
        descLabel.text = employee.position
    }
    
    private func setupViews() {
        [titleLabel, descLabel].forEach(contentView.addSubview)
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.top.equalTo(8)
        }
        descLabel.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.bottom.equalTo(-8)
        }
    }
}
