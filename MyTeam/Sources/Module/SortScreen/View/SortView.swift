//
//  SortView.swift
//  MyTeam
//
//  Created by User on 22.11.2022.
//

import UIKit

final class SortView: BaseView {

    // MARK: - Constants

    private enum Constants {

        enum TopView {
            static let cornerRadius: CGFloat = 2
            static let width: CGFloat = 56
            static let height: CGFloat = 4
        }

        enum TitleLable {
            static let font = Resources.Fonts.interSemiBold(with: 20)
            static let top: CGFloat = 24
        }

        enum ButtonStack {
            static let spacing: CGFloat = 35
            static let top: CGFloat = 41.5
            static let leading: CGFloat = 26
            static let trailing: CGFloat = 26
        }
    }

    // MARK: - Properties

    var sortButtonArray: [SortButton] = []

    // MARK: - Views

    private let buttonStack = SortView.makeButtonStack()
    private let topView = SortView.makeTopView()
    private let titleLabel = SortView.makeTitleLabel()

    // MARK: - Setting View

    override func setViewAppearance() {
        backgroundColor = .white

        SortModel.allCases.forEach({ model in
            let sortButton = SortButton(model: model, title: getModelName(model))
            buttonStack.addArrangedSubview(sortButton)
            sortButtonArray.append(sortButton)
        })
    }

    override func setViewPosition() {
        [topView, titleLabel, buttonStack].forEach { addView($0) }

        NSLayoutConstraint.activate([
            topView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            topView.widthAnchor.constraint(equalToConstant: Constants.TopView.width),
            topView.heightAnchor.constraint(equalToConstant: Constants.TopView.height),
            topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: .zero),

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.TitleLable.top),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            buttonStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                             constant: Constants.ButtonStack.top),
            buttonStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                                 constant: Constants.ButtonStack.leading),
            buttonStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                                  constant: Constants.ButtonStack.trailing)
        ])
    }
}

// MARK: - Creating Subviews

private extension SortView {

    static func makeTopView() -> UIView {
        let topView = UIView()

        topView.backgroundColor = Resources.Colors.SearchBar.placeholder
        topView.layer.cornerRadius = Constants.TopView.cornerRadius

        return topView
    }

    static func makeTitleLabel() -> UILabel {
        let titleLabel = UILabel()

        titleLabel.text = Resources.Strings.Sort.title.localizedString
        titleLabel.font = Constants.TitleLable.font
        titleLabel.textColor = Resources.Colors.Text.active

        return titleLabel
    }

    static func makeButtonStack() -> UIStackView {
        let buttonStack = UIStackView()

        buttonStack.axis = .vertical
        buttonStack.spacing = Constants.ButtonStack.spacing
        buttonStack.alignment = .leading

        return buttonStack
    }
}

// MARK: - Private Methods

private extension SortView {

    func getModelName(_ model: SortModel) -> String {
        switch model {
        case .alphabet:
            return Resources.Strings.Sort.sortByAlphabet.localizedString
        case .birhDate:
            return Resources.Strings.Sort.sortByBirthday.localizedString
        }
    }
}
