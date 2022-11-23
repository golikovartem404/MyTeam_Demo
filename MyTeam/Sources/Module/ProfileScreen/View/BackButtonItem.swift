//
//  BackButtonView.swift
//  MyTeam
//
//  Created by User on 23.11.2022.
//

import UIKit

final class BackBarButtonItem: UIBarButtonItem {

    // MARK: - Initialization

    convenience init(target: UINavigationController) {
        self.init()
        self.target = target
        setViewAppearance()
    }

    override init() {
        super.init()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Private Methods

private extension BackBarButtonItem {

    func setViewAppearance() {
        style = .plain
        image = Resources.Images.backArrow
        tintColor = .black
        action = #selector(UINavigationController.popViewController(animated:))
    }
}
