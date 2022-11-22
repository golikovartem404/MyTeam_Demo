//
//  PhoneView.swift
//  MyTeam
//
//  Created by User on 22.11.2022.
//

import UIKit

class PhoneView: BaseView {

    // MARK: - Outlets

    private lazy var phoneView: UIView = {
        let view = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: 73.5)
        )
        return view
    }()

    private lazy var phoneImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "phone")
        view.layer.borderWidth = 0
        return view
    }()

    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 16)
        return label
    }()

    // MARK: - Setups

    override func setup() {
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        addSubview(phoneView)
        addSubview(phoneImageView)
        addSubview(phoneLabel)
    }

    private func setupLayout() {
        phoneImageView.snp.makeConstraints { make in
            make.centerY.equalTo(phoneView.snp.centerY)
            make.leading.equalTo(phoneView.safeAreaLayoutGuide.snp.leading).offset(20)
        }

        phoneLabel.snp.makeConstraints { make in
            make.centerY.equalTo(phoneImageView.snp.centerY)
            make.leading.equalTo(phoneImageView.snp.trailing).offset(14)
        }
    }

    // MARK: - Methods

    func setData(phoneNumber: String) {
        self.phoneLabel.text = phoneNumber
    }
}
