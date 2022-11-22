//
//  TopTabsCollectionViewCell.swift
//  MyTeam
//
//  Created by User on 21.11.2022.
//

import UIKit
import SnapKit

final class TopTabsCollectionViewCell: UICollectionViewCell {

    // MARK: - Constants

    private enum Constants {

        static let borderHeight: CGFloat = 2

        enum Text {
            static let font = Resources.Fonts.interMedium(with: 15)
            static let selectedFont = Resources.Fonts.interSemiBold(with: 15)
        }

        enum Content {
            static let height: CGFloat = 36
            static let width: CGFloat = -16
            static let leading: CGFloat = 16
        }
    }

    // MARK: - Properties

    static let identifier = "Cell"

    private(set) var model: Department?

    // MARK: - Views

    private let bottomBorderView = UIView()
    private let label = UILabel()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setBorderAppearance()
        layoutSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        [label, bottomBorderView].forEach { contentView.addSubview($0) }
        [contentView, label, bottomBorderView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: Constants.Content.height),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Content.leading),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor, constant: Constants.Content.width),

            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            bottomBorderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomBorderView.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            bottomBorderView.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            bottomBorderView.heightAnchor.constraint(equalToConstant: Constants.borderHeight)
        ])
    }
}

// MARK: - Public Methods

extension TopTabsCollectionViewCell {

    func setCellSelected(_ isSelected: Bool) {
        if isSelected {
            bottomBorderView.isHidden = false
            label.textColor = Resources.Colors.Text.active
            label.font = Constants.Text.font
        } else {
            bottomBorderView.isHidden = true
            label.textColor = Resources.Colors.Text.inActive
            label.font = Constants.Text.selectedFont
        }
    }

    func setModel(_ department: Department) {
        self.model = department
        label.text = department.title
        label.textColor = Resources.Colors.Text.inActive
    }
}

// MARK: - Private Methods

private extension TopTabsCollectionViewCell {

    func setBorderAppearance() {
        bottomBorderView.backgroundColor = Resources.Colors.violet
        bottomBorderView.isHidden = false
    }
}
