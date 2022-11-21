//
//  BaseView.swift
//  MyTeam
//
//  Created by User on 21.11.2022.
//

import UIKit

 class BaseView: UIView {

     override init(frame: CGRect) {
         super.init(frame: frame)
         setup()
     }

     required init?(coder: NSCoder) {
         super.init(coder: coder)
     }
     
     func setup() {
         // for ovveride
     }
 }
