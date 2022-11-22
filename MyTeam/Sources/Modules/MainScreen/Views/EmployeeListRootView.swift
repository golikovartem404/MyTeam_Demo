//
//  EmployeeListRootView.swift
//  MyTeam
//
//  Created by User on 21.11.2022.
//

import UIKit

 class EmployeeListRootView: BaseView {

     //MARK: - Outlets

     let globalView: UIView = {
         let view = UIView()
         view.backgroundColor = UIColor(red: 0.02, green: 0.02, blue: 0.063, alpha: 0.16)
         view.isHidden = true
         return view
     }()

     let cancelButton: UIButton = {
         let button = UIButton()
         button.setTitle("Cancel", for: .normal)
         button.setTitleColor(UIColor(red: 0.396, green: 0.204, blue: 1, alpha: 1), for: .normal)
         button.setTitleColor(UIColor.white, for: .highlighted)
         button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 14)
         button.isHidden = true
         return button
     }()

     var searchTextField = SearchTextField(insets: UIEdgeInsets(top: 10, left: 44, bottom: 10, right: 35))

     let topTabsCollectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
         layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
         let tab = UICollectionView(frame: .zero, collectionViewLayout: layout)
         tab.backgroundColor = .clear
         return tab
     }()

     private let separatorLineUnderTabs: UIView = {
         let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.33))
         view.backgroundColor = UIColor(red: 0.765, green: 0.765, blue: 0.776, alpha: 1)
         return view
     }()

     let employeeTableView = UITableView()

     let notFoundSearchView: NotFoundOnSearchView = {
         let view = NotFoundOnSearchView()
         view.isHidden = true
         return view
     }()

     let errorView = LostInternetConnectionView()

     //MARK: - Setup View

     override func setup() {
         backgroundColor = .white
         employeeTableView.backgroundColor = .white
         setupHierarchy()
         setupLayout()
         setViewDependingOnConnection()
     }

     private func setupHierarchy() {
         addSubview(searchTextField)
         addSubview(cancelButton)
         addSubview(employeeTableView)
         addSubview(notFoundSearchView)
         addSubview(topTabsCollectionView)
         addSubview(separatorLineUnderTabs)
         addSubview(errorView)
         addSubview(globalView)
     }

     private func setupLayout() {
         globalView.snp.makeConstraints { make in
             make.top.leading.trailing.bottom.equalTo(self)
         }

         searchTextField.snp.makeConstraints { make in
             make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
             make.leading.equalTo(self.snp.leading).offset(16)
             make.trailing.equalTo(self.snp.trailing).offset(-16)
             make.width.equalTo(343)
             make.height.equalTo(40)
         }

         cancelButton.snp.makeConstraints { make in
             make.leading.equalTo(searchTextField.snp.trailing).offset(12)
             make.centerY.equalTo(searchTextField.snp.centerY)
             make.trailing.equalTo(self.snp.trailing).offset(-28)
         }

         topTabsCollectionView.snp.makeConstraints { make in
             make.top.equalTo(searchTextField.snp.bottom).offset(6)
             make.leading.equalTo(self.snp.leading)
             make.trailing.equalTo(self.snp.trailing)
             make.height.equalTo(36)
         }

         separatorLineUnderTabs.snp.makeConstraints { make in
             make.top.equalTo(topTabsCollectionView.snp.bottom).offset(7.67)
             make.leading.equalTo(self.snp.leading)
             make.trailing.equalTo(self.snp.trailing)
             make.height.equalTo(0.33)
         }

         notFoundSearchView.snp.makeConstraints { make in
             make.top.equalTo(topTabsCollectionView.snp.bottom).offset(22)
             make.leading.equalTo(self.snp.leading)
             make.trailing.equalTo(self.snp.trailing)
             make.bottom.equalTo(self.snp.bottom)
         }

         employeeTableView.snp.makeConstraints { make in
             make.top.equalTo(topTabsCollectionView.snp.bottom).offset(22)
             make.leading.equalTo(self.snp.leading)
             make.trailing.equalTo(self.snp.trailing)
             make.bottom.equalTo(self.snp.bottom)
         }

         errorView.snp.makeConstraints { make in
             make.top.leading.trailing.bottom.equalTo(self)
         }
     }

     func setDimView(_ shouldSet: Bool) {
         shouldSet ? (globalView.isHidden = false) : (globalView.isHidden = true)
     }

     func setNotFoundView() {
         employeeTableView.isHidden = true
         notFoundSearchView.isHidden = false
     }

     func setIsFoundView() {
         employeeTableView.isHidden = false
         notFoundSearchView.isHidden = true
     }

     private func setViewDependingOnConnection() {

         NetworkMonitor.shared.startMonitoring()
         print("T/f \(NetworkMonitor.shared.isConnected)")
         print("Internet Connection Checking")

         if NetworkMonitor.shared.isConnected {
             print("Internet Connection is OK")
             errorView.isHidden = true
             searchTextField.isHidden = false
             employeeTableView.isHidden = false
             topTabsCollectionView.isHidden = false
         } else {
             print("Not Internet Connection")
             searchTextField.isHidden = true
             employeeTableView.isHidden = true
             topTabsCollectionView.isHidden = true
             errorView.isHidden = false
         }
         NetworkMonitor.shared.stopMonitoring()
     }

     func setErrorView() {
         searchTextField.isHidden = true
         employeeTableView.isHidden = true
         topTabsCollectionView.isHidden = true
         errorView.isHidden = false
     }

     func setMainView() {
         errorView.isHidden = true
         searchTextField.isHidden = false
         employeeTableView.isHidden = false
         topTabsCollectionView.isHidden = false
     }

     func setSearchEditingMode() {
         searchTextField.snp.makeConstraints { make in
             make.width.equalTo(265)
             make.trailing.equalTo(cancelButton.snp.leading).offset(-16)
         }
         cancelButton.isHidden = false
         searchTextField.rightImageButton.isHidden = true
         let leftView = UIImageView()
         leftView.image = UIImage(named: "vector_editing")
         self.searchTextField.leftView = leftView
     }
 }
