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
        button.setBackgroundImage(UIImage(named: "UnChecked"), for: .normal)
        button.setBackgroundImage(UIImage(named: "isChecked"), for: .selected)
        button.titleLabel?.text = "By alphabet"
        button.titleLabel?.textColor = .black
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 16)
        return button
    }()

    let birthdaySortButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "UnChecked"), for: .normal)
        button.setBackgroundImage(UIImage(named: "isChecked"), for: .selected)
        button.titleLabel?.text = "By birthday"
        button.titleLabel?.textColor = .black
        button.titleLabel?.font = UIFont(name: "Inter-Medium", size: 16)
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sorting"
        label.textColor = UIColor(red: 0.02, green: 0.02, blue: 0.063, alpha: 1)
        label.font = UIFont(name: "Inter-SemiBlond", size: 20)
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
            make.top.equalTo(self.snp.top).offset(84)
            make.leading.equalTo(self.snp.leading).offset(18)
        }

        birthdaySortButton.snp.makeConstraints { make in
            make.top.equalTo(alphabetSortButton.snp.bottom).offset(40)
            make.leading.equalTo(alphabetSortButton.snp.leading)
        }
    }
}
