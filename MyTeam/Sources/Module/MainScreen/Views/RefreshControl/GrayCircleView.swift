//
//  GrayCircleView.swift
//  MyTeam
//
//  Created by User on 22.11.2022.
//

import UIKit

final class GrayCircleView: BaseView {

    // MARK: - Views

    private let spinnignCircle = CAShapeLayer()

    // MARK: - Setting View

    override func setViewAppearance() {
        let rect = self.bounds
        let circlarPath = UIBezierPath(ovalIn: rect)

        spinnignCircle.path = circlarPath.cgPath
        spinnignCircle.fillColor = UIColor.clear.cgColor
        spinnignCircle.strokeColor = Resources.Colors.profileBackground.cgColor
        spinnignCircle.lineWidth = CGFloat(integerLiteral: .two)
        spinnignCircle.lineCap = .round

        self.layer.addSublayer(spinnignCircle)
    }
}
