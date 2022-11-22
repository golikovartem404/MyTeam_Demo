//
//  BaseViewController.swift
//  MyTeam
//
//  Created by User on 21.11.2022.
//

import UIKit

 class BaseViewController<T: UIView>: UIViewController {

     var mainView: T {
         view as! T
     }

     override func loadView() {
         view = T()
     }
 }
