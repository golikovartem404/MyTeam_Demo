//
//  ProfileView.swift
//  MyTeam
//
//  Created by User on 22.11.2022.
//

import UIKit

class ProfileView: BaseView {

    // MARK: - Outlets

    private let birthView = BirthView()
    let phoneView = PhoneView()

    private let upView: UIView = {
        let view = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height/2.7)
        )
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 248/255, alpha: 1)
        return view
    }()

    private let employeeImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "goose")
        view.layer.shadowColor = CGColor(red: 22/255, green: 30/255, blue: 52/255, alpha: 0.08)
        view.layer.shadowOffset = CGSize(width: 0, height: 8)
        view.layer.shadowRadius = 12
        view.layer.shadowOpacity = 1
        return view
    }()

    let nameLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = UIFont(name: "Inter-Bold", size: 24)
        view.textColor = UIColor(red: 0.02, green: 0.02, blue: 0.063, alpha: 1)
        return view
    }()

    let tagLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = UIFont(name: "Inter-Regular", size: 14)
        view.textColor = UIColor(red: 0.591, green: 0.591, blue: 0.609, alpha: 1)
        return view
    }()

    let departmentLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = UIFont(name: "Inter-Regular", size: 13)
        view.textColor = UIColor(red: 0.333, green: 0.333, blue: 0.361, alpha: 1)
        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 73.5
        return view
    }()

    // MARK: - Setups

    override func setup() {
        setupView()
        setupHierarchy()
        setupLayout()
    }

    private func setupView() {
        employeeImageView.image = employeeImageView.image?.resized(CGSize(width: 104, height: 104))
        employeeImageView.contentMode = .scaleAspectFill
        backgroundColor = .white
    }

    private func setupHierarchy() {
        stackView.addArrangedSubview(birthView)
        stackView.addArrangedSubview(phoneView)
        addSubview(stackView)
        addSubview(upView)
        addSubview(employeeImageView)
        addSubview(nameLabel)
        addSubview(tagLabel)
        addSubview(departmentLabel)
    }

    private func setupLayout() {
        employeeImageView.snp.makeConstraints { make in
            make.top.equalTo(upView.snp.top).offset(104)
            make.centerX.equalTo(upView.snp.centerX)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(upView.snp.centerX)
            make.top.equalTo(employeeImageView.snp.bottom).offset(24)
        }

        tagLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(4)
            make.centerY.equalTo(nameLabel.snp.centerY)
        }

        departmentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(upView.snp.centerX)
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(upView.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
    }

    func setData(
        firstName: String,
        lastName: String,
        tag: String,
        department: DepartmentModel?,
        phone: String,
        dateBirth: String,
        years: String
    ) {
        self.nameLabel.text = "\(firstName) \(lastName)"
        self.tagLabel.text = tag
        self.departmentLabel.text = department?.title
        phoneView.setData(phoneNumber: phone)
        birthView.setData(dateBirth: dateBirth, years: years)
    }
}
