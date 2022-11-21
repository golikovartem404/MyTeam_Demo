//
//  TopTabsCollectionViewCell.swift
//  MyTeam
//
//  Created by User on 21.11.2022.
//

import UIKit
import SnapKit

class TopTabsCollectionViewCell: UICollectionViewCell {

    private(set) var model: DepartmentModel?

    static let identifier = "TopTabsCollectionViewCell"

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 15)
        return label
    }()

    private lazy var bottomBorderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 2))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        label.textColor = .black
        bottomBorderView.backgroundColor = .blue
        bottomBorderView.isHidden = false
    }

    private func setupHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(bottomBorderView)
        layoutSubviews()
    }

    private func setupLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing)
            make.width.equalTo(self.snp.width).offset(-16)
        }
    }
    
    override func layoutSubviews() {
        label.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(self.snp.height)
        }

        bottomBorderView.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(label.snp.leading)
            make.trailing.equalTo(label.snp.trailing)
            make.height.equalTo(2)
        }
    }

    func setCellSelected(_ isSelected: Bool) {
        if isSelected {
            bottomBorderView.isHidden = false
            label.textColor = UIColor(red: 0.02, green: 0.02, blue: 0.063, alpha: 1)
        } else {
            bottomBorderView.isHidden = true
            label.textColor = UIColor(red: 0.591, green: 0.591, blue: 0.609, alpha: 1)
        }
    }

    func setModel(_ department: DepartmentModel) {
        self.model = department
        label.text = department.title
        label.textColor = UIColor(red: 0.591, green: 0.591, blue: 0.609, alpha: 1)
    }
}
