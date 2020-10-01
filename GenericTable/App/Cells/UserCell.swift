//
//  UserCell.swift
//  GenericTable
//
//  Created by Turan Assylkhan on 10/1/20.
//  Copyright © 2020 Turan Assylkhan. All rights reserved.
//

import UIKit

class UserCell: ConfigurableCell {
    
    private let imgView = UIImageView()
    
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
    
    func configure(with user: User) {
        titleLabel.text = user.name
        imgView.image = UIImage(named: user.image)
    }
    
    private func setupViews() {
        [imgView, titleLabel].forEach(contentView.addSubview)
        
        imgView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.left.equalTo(16)
            $0.top.equalTo(12)
            $0.bottom.equalTo(-12)
        }
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(imgView.snp.right).offset(8)
            $0.centerY.equalToSuperview()
        }
    }
}
