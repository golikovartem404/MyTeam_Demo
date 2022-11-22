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
     let searchBar = UISearchBar()

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

         topTabsCollectionView.snp.makeConstraints { make in
             make.top.equalTo(self.snp.top).offset(70)
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

     func setupSearchBar() {
         let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
         textFieldInsideSearchBar?.backgroundColor = UIColor(
            red: 247.0/255.0,
            green: 247.0/255.0,
            blue: 248.0/255.0,
            alpha: 1)
         searchBar.tintColor = UIColor(red: 0.396, green: 0.204, blue: 1, alpha: 1)
         searchBar.setImage(
            UIImage(named: "list-ui-alt"),
            for: .bookmark,
            state: .normal
         )
         searchBar.backgroundColor = .white
         searchBar.showsBookmarkButton = true
         searchBar.placeholder = "Please enter name, tag or email..."
         searchBar.setValue("Cancel", forKey: "cancelButtonText")
     }

     func setDimView(_ shouldSet: Bool) {
         shouldSet ? (globalView.isHidden = false) : (globalView.isHidden = true)
     }

     func setNotFoundView() {
         employeeTableView.isHidden = true
         notFoundSearchView.isHidden = false
     }

     func setIsFoundView() {
         notFoundSearchView.isHidden = true
         employeeTableView.isHidden = false
     }

     private func setViewDependingOnConnection() {
         NetworkMonitor.shared.startMonitoring()
         print("T/f \(NetworkMonitor.shared.isConnected)")
         print("Internet Connection Checking")
         if NetworkMonitor.shared.isConnected {
             print("Internet Connection is OK")
             errorView.isHidden = true
             employeeTableView.isHidden = false
             topTabsCollectionView.isHidden = false
         } else {
             print("Not Internet Connection")
             employeeTableView.isHidden = true
             topTabsCollectionView.isHidden = true
             errorView.isHidden = false
         }
         NetworkMonitor.shared.stopMonitoring()
     }

     func setErrorView() {
         employeeTableView.isHidden = true
         topTabsCollectionView.isHidden = true
         errorView.isHidden = false
         searchBar.isHidden = true
     }

     func setMainView() {
         errorView.isHidden = true
         employeeTableView.isHidden = false
         topTabsCollectionView.isHidden = false
     }

     func setSearchEditingMode() {
          searchBar.isHidden = false
      }

 }
