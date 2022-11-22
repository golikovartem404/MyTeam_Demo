//
//  HeaderSectionView.swift
//  MyTeam
//
//  Created by User on 22.11.2022.
//

import UIKit

class HeaderSectionView: BaseView {

    // MARK: - Outlets

    private let yearLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Inter-SemiBold", size: 15)
        view.text = "2023"
        view.textColor = UIColor(red: 0.765, green: 0.765, blue: 0.776, alpha: 1)
        view.contentMode = .scaleAspectFit
        view.textAlignment = .center
        return view
    }()

    private let rightLine: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        view.backgroundColor = UIColor(red: 0.765, green: 0.765, blue: 0.776, alpha: 1)
        return view
    }()

    private let leftLine: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        view.backgroundColor = UIColor(red: 0.765, green: 0.765, blue: 0.776, alpha: 1)
        return view
    }()

    // MARK: - Setups

    override func setup() {
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        addSubview(yearLabel)
        addSubview(rightLine)
        addSubview(leftLine)
    }

    private func setupLayout() {
        yearLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY).offset(-15)
            make.centerX.equalTo(self.snp.centerX)
        }

        leftLine.snp.makeConstraints { make in
            make.centerY.equalTo(yearLabel.snp.centerY)
            make.trailing.equalTo(yearLabel.snp.leading)
            make.leading.equalTo(self.snp.leading).offset(24)
            make.height.equalTo(1)
            make.width.equalTo(72)
        }

        rightLine.snp.makeConstraints { make in
            make.centerY.equalTo(yearLabel.snp.centerY)
            make.trailing.equalTo(self.snp.trailing).offset(-24)
            make.leading.equalTo(yearLabel.snp.trailing)
            make.height.equalTo(1)
            make.width.equalTo(72)
        }
    }
}
