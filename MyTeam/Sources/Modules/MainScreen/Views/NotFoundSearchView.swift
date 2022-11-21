//
//  NotFoundSearchView.swift
//  MyTeam
//
//  Created by User on 21.11.2022.
//

import UIKit

class NotFoundOnSearchView: BaseView {

    // MARK: - Outlets

    private let loupeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "loupe")
        return view
    }()

    private let employeeNotFoundLabel: UILabel = {
        let view = UILabel()
        view.text = "Employees not found"
        view.font = UIFont(name: "Inter-SemiBold", size: 17)
        view.textColor = UIColor(red: 0.02, green: 0.02, blue: 0.063, alpha: 1)
        view.contentMode = .scaleAspectFit
        view.textAlignment = .center
        return view
    }()

    private let tryToCorrectLabel: UILabel = {
        let view = UILabel()
        view.text = "Try to change request"
        view.font = UIFont(name: "Inter-Regular", size: 16)
        view.textColor = UIColor(red: 0.591, green: 0.591, blue: 0.609, alpha: 1)
        view.contentMode = .scaleAspectFit
        view.textAlignment = .center
        return view
    }()

    // MARK: - Setups

    override func setup() {
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        addSubview(loupeImage)
        addSubview(employeeNotFoundLabel)
        addSubview(tryToCorrectLabel)
    }

    private func setupLayout() {

        loupeImage.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(42)
            make.width.height.equalTo(56)
        }

        employeeNotFoundLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(loupeImage.snp.bottom).offset(8)
        }

        tryToCorrectLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(employeeNotFoundLabel.snp.bottom).offset(12)
        }
    }
}
