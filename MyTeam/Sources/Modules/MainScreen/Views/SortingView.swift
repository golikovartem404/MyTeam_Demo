//
//  SortingView.swift
//  MyTeam
//
//  Created by User on 22.11.2022.
//

import UIKit

class SortView: BaseView {

    let alphabetSortButton: UIButton = {
        let button = UIButton()
        button.setTitle("By alphabet", for: .normal)
        button.setImage(UIImage(named: "unChecked"), for: .normal)
        button.setImage(UIImage(named: "isChecked"), for: .selected)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 16)
        button.titleEdgeInsets.left = 14
        return button
    }()

    let birthdaySortButton: UIButton = {
        let button = UIButton()
        button.setTitle("By birthday", for: .normal)
        button.setImage(UIImage(named: "unChecked"), for: .normal)
        button.setImage(UIImage(named: "isChecked"), for: .selected)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 16)
        button.titleEdgeInsets.left = 14
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sorting"
        label.textColor = UIColor(red: 0.02, green: 0.02, blue: 0.063, alpha: 1)
        label.font = UIFont(name: "Inter-SemiBold", size: 20)
        return label
    }()

    override func setup() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(alphabetSortButton)
        addSubview(birthdaySortButton)
    }

    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(24)
            make.centerX.equalTo(self.snp.centerX)
        }

        alphabetSortButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(41.5)
            make.leading.equalTo(self.snp.leading).offset(26)
            make.trailing.equalTo(self.snp.trailing).offset(-214)
        }

        birthdaySortButton.snp.makeConstraints { make in
            make.top.equalTo(alphabetSortButton.snp.bottom).offset(35)
            make.leading.equalTo(alphabetSortButton.snp.leading)
            make.trailing.equalTo(self.snp.trailing).offset(-172)
        }
    }
}
