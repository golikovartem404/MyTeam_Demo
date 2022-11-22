//
//  UIView + Ext.swift
//  MyTeam
//
//  Created by User on 22.11.2022.
//

import UIKit

extension UIView {

    func addView(_ view: UIView) {
          self.addSubview(view)
          view.translatesAutoresizingMaskIntoConstraints = false
    }
}
