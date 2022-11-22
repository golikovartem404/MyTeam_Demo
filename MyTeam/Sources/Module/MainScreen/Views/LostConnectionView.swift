//
//  LostConnectionView.swift
//  MyTeam
//
//  Created by User on 21.11.2022.
//

import UIKit

 class LostInternetConnectionView: BaseView {

     // MARK: - Outlets

     private lazy var NLOImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(named: "NLO")
         imageView.clipsToBounds = true
         imageView.layer.borderWidth = 0
         return imageView
     }()

     private lazy var titleLabel: UILabel = {
         let label = UILabel()
         label.text = "Something went wrong"
         label.numberOfLines = 0
         label.font = UIFont(name: "SemiBold", size: 17)
         label.textColor = UIColor(red: 0.05, green: 0.05, blue: 0.16, alpha: 1)
         return label
     }()

     private lazy var subTitleLabel: UILabel = {
         let label = UILabel()
         label.text = "We are trying to fix problem"
         label.numberOfLines = 0
         label.font = UIFont(name: "Regular", size: 16)
         label.textColor = UIColor(red: 151/255, green: 151/255, blue: 155/255, alpha: 1)
         return label
     }()

     lazy var tryAgainButton: UIButton = {
         let button = UIButton()
         button.backgroundColor = .clear
         button.setTitle("Try again", for: .normal)
         button.setTitleColor(UIColor(red: 101/255, green: 52/255, blue: 1, alpha: 1), for: .normal)
         button.setTitle("I'm pressed", for: .highlighted)
         button.titleLabel?.font = UIFont(name: "SemiBold", size: 17)
         return button
     }()

     // MARK: - Setups

     override func setup() {
         setupHierarchy()
         setupLayout()
     }

     private func setupHierarchy() {
         addSubview(NLOImageView)
         addSubview(titleLabel)
         addSubview(subTitleLabel)
         addSubview(tryAgainButton)
     }

     private func setupLayout() {
         NLOImageView.snp.makeConstraints { make in
             make.centerX.equalTo(self.snp.centerX)
             make.centerY.equalTo(self.snp.centerY).offset(-50)
         }

         titleLabel.snp.makeConstraints { make in
             make.centerX.equalTo(self.snp.centerX)
             make.top.equalTo(NLOImageView.snp.bottom).offset(8)
         }

         subTitleLabel.snp.makeConstraints { make in
             make.centerX.equalTo(self.snp.centerX)
             make.top.equalTo(titleLabel.snp.bottom).offset(12)
         }

         tryAgainButton.snp.makeConstraints { make in
             make.centerX.equalTo(self.snp.centerX)
             make.top.equalTo(subTitleLabel.snp.bottom).offset(12)
         }
     }
 }
