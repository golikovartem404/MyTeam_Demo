//
//  EmployeeTableViewCell.swift
//  MyTeam
//
//  Created by User on 21.11.2022.
//

import UIKit

 class EmployeeTableViewCell: UITableViewCell {

     // MARK: - Properties

     var shouldShowBirthday = false
     static let identifier = "EmployeeTableViewCell"

     // MARK: - Outlets

     private lazy var employeeImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.clipsToBounds = true
         imageView.layer.borderWidth = 0
         return imageView
     }()

     private lazy var nameLabel: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.textColor = UIColor(red: 0.02, green: 0.02, blue: 0.063, alpha: 1)
         label.font = UIFont(name: "Inter-Medium", size: 16)
         return label
     }()

     private lazy var tagLabel: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.textColor = UIColor(red: 0.591, green: 0.591, blue: 0.609, alpha: 1)
         label.font = UIFont(name: "Inter-Medium", size: 14)
         return label
     }()

     private lazy var departmentLabel: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.textColor = UIColor(red: 0.333, green: 0.333, blue: 0.361, alpha: 1)
         label.font = UIFont(name: "Inter-Regular", size: 13)
         return label
     }()

     lazy var birthdayLabel: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.textColor = UIColor(red: 0.333, green: 0.333, blue: 0.361, alpha: 1)
         label.font = UIFont(name: "Inter-Regular", size: 15)
         label.isHidden = true
         return label
     }()

     // MARK: - Loading views

     private lazy var nameLoadingView: UIView = {
         let view = UIView()
         view.frame = CGRect(x: 0, y: 0, width: 144, height: 16)
         view.layer.cornerRadius = 8
         view.backgroundColor = UIColor(red: 0.955, green: 0.955, blue: 0.965, alpha: 1)
         return view
     }()

     private lazy var departmentLoadingView: UIView = {
         let view = UIView()
         view.frame = CGRect(x: 0, y: 0, width: 80, height: 12)
         view.layer.cornerRadius = 6
         view.backgroundColor = UIColor(red: 0.955, green: 0.955, blue: 0.965, alpha: 1)
         return view
     }()

     private lazy var imageLoadingView: UIView = {
         let view = UIView()
         view.frame = CGRect(x: 0, y: 0, width: 72, height: 72)
         view.layer.cornerRadius = 36
         view.backgroundColor = UIColor(red: 0.955, green: 0.955, blue: 0.965, alpha: 1)
         return view
     }()

     // MARK: - Lifecycle

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupHierarchy()
         setupLayout()
         setLoadingViewsConstraints()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     // MARK: - Setups

     private func setupHierarchy() {
         addSubview(employeeImageView)
         addSubview(nameLabel)
         addSubview(tagLabel)
         addSubview(departmentLabel)
         addSubview(birthdayLabel)
         addSubview(imageLoadingView)
         addSubview(nameLoadingView)
         addSubview(departmentLoadingView)
     }

     private func setupLayout() {

         employeeImageView.snp.makeConstraints { make in
             make.centerY.equalTo(self.snp.centerY)
             make.leading.equalTo(self.snp.leading).offset(10)
             make.width.height.equalTo(72)
         }

         nameLabel.snp.makeConstraints { make in
             make.leading.equalTo(employeeImageView.snp.trailing).offset(16)
             make.centerY.equalTo(employeeImageView.snp.centerY).offset(-20)
         }

         tagLabel.snp.makeConstraints { make in
             make.leading.equalTo(nameLabel.snp.trailing).offset(4)
             make.centerY.equalTo(nameLabel.snp.centerY)
         }

         departmentLabel.snp.makeConstraints { make in
             make.leading.equalTo(nameLabel.snp.leading)
             make.centerY.equalTo(nameLabel.snp.centerY).offset(20)
         }

         birthdayLabel.snp.makeConstraints { make in
             make.centerY.equalTo(employeeImageView.snp.centerY).offset(-12)
             make.trailing.equalTo(self.snp.trailing).offset(-19.5)
         }
     }

     private func setLoadingViewsConstraints() {

         imageLoadingView.snp.makeConstraints { make in
             make.centerY.equalTo(self.snp.centerY)
             make.leading.equalTo(self.snp.leading).offset(10)
             make.width.height.equalTo(72)
         }

         nameLoadingView.snp.makeConstraints { make in
             make.leading.equalTo(imageLoadingView.snp.trailing).offset(16)
             make.centerY.equalTo(imageLoadingView.snp.centerY).offset(-20)
             make.width.equalTo(144)
             make.height.equalTo(16)
         }

         departmentLoadingView.snp.makeConstraints { make in
             make.leading.equalTo(nameLoadingView.snp.leading)
             make.centerY.equalTo(nameLoadingView.snp.centerY).offset(20)
             make.width.equalTo(80)
             make.height.equalTo(12)
         }
     }

     func setBirthdayLabelVisibility(shouldShowBirthday: Bool) {
         birthdayLabel.isHidden = !shouldShowBirthday
     }

     func setLoadingView() {
         nameLabel.isHidden = true
         employeeImageView.isHidden = true
         departmentLabel.isHidden = true
         tagLabel.isHidden = true
         departmentLabel.isHidden = true

         imageLoadingView.isHidden = false
         nameLoadingView.isHidden = false
         departmentLoadingView.isHidden = false
     }

     func setViewWithData() {
         nameLabel.isHidden = false
         employeeImageView.isHidden = false
         departmentLabel.isHidden = false
         tagLabel.isHidden = false
         departmentLabel.isHidden = false

         imageLoadingView.isHidden = true
         nameLoadingView.isHidden = true
         departmentLoadingView.isHidden = true
     }

     func setData(firstName: String, lastName: String, tag: String, department: DepartmentModel?, dateBirth: String) {
         employeeImageView.image = UIImage(named: "goose")
         nameLabel.text = "\(firstName) \(lastName)"
         tagLabel.text = tag
         departmentLabel.text = department?.title
         birthdayLabel.text = dateBirth
     }
 }
