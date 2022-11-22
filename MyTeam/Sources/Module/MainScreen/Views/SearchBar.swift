//
//  SearchBar.swift
//  MyTeam
//
//  Created by User on 22.11.2022.
//

import UIKit

final class SearchBar: UISearchBar {

    // MARK: - Constants

    private enum Constants {

        static let cornerRadius: CGFloat = 16
        static let adjustingTextOffset: UIOffset = .init(horizontal: 10, vertical: .zero)
        static let adjustingRightIconOffset: UIOffset = .init(horizontal: -10, vertical: .zero)
        static let leftView = UIImageView(image: Resources.Images.SearchBar.leftImageNormal)

        enum TextFild {
            static let font = Resources.Fonts.interRegular(with: 15)
            static let key = "searchField"
            static let color = Resources.Colors.SearchBar.secondary
        }

        enum CancelButton {
            static let key = "cancelButtonText"
            static let attributes: [NSAttributedString.Key: Any] = [
                .font: Resources.Fonts.interSemiBold(with: 15),
                .foregroundColor: Resources.Colors.violet
            ]
        }

        enum Placeholder {
            static let attributes: [NSAttributedString.Key: Any] = [
                .font: Resources.Fonts.interMedium(with: 15),
                .foregroundColor: Resources.Colors.SearchBar.placeholder
            ]
            static let attributedString: NSAttributedString = .init(
                string: Resources.Strings.SearchBar.placeholder.localizedString,
                attributes: attributes
            )
        }
    }

    // MARK: - Initialization

    convenience init() {
        self.init(frame: .zero)
        setViewAppearance()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Private Methods

private extension SearchBar {

    func setViewAppearance() {
        showsBookmarkButton = true

        setImage(Resources.Images.SearchBar.rightImageNormal, for: .bookmark, state: .normal)
        setImage(Resources.Images.SearchBar.rightImageSelected, for: .bookmark, state: .selected)
        setImage(Resources.Images.SearchBar.clear, for: .clear, state: .normal)

        setValue(Resources.Strings.SearchBar.cancel.localizedString, forKey: Constants.CancelButton.key)

        setSearchFieldBackgroundImage(UIImage.image(color: Resources.Colors.SearchBar.secondary), for: .normal)

        setPositionAdjustment(Constants.adjustingTextOffset, for: .search)
        setPositionAdjustment(Constants.adjustingRightIconOffset, for: .bookmark)
        setPositionAdjustment(Constants.adjustingRightIconOffset, for: .clear)
        searchTextPositionAdjustment = Constants.adjustingTextOffset

        searchTextField.layer.masksToBounds = true
        searchTextField.layer.cornerRadius = Constants.cornerRadius
        searchTextField.leftView = Constants.leftView
        searchTextField.font = Constants.TextFild.font
        searchTextField.attributedPlaceholder = Constants.Placeholder.attributedString
        searchTextField.tintColor = Resources.Colors.violet

        let barButtonAppearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        barButtonAppearance.setTitleTextAttributes(Constants.CancelButton.attributes, for: .normal)

        let textFieldInsideSearchBar = value(forKey: Constants.TextFild.key) as? UITextField
        textFieldInsideSearchBar?.backgroundColor = Constants.TextFild.color
    }
}

// MARK: - Image for SerchBar size

private extension UIImage {

    /// SearchBar size of the depends on this image
    static func image(color: UIColor = .clear, size: CGSize = CGSize(width: 1, height: 40)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            color.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
