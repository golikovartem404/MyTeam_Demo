//
//  Department.swift
//  MyTeam
//
//  Created by User on 22.11.2022.
//

import Foundation

// MARK: - Cases

enum Department: String, Codable {
    case all
    case design
    case analytics
    case management
    case ios
    case android
    case qa
    case frontend
    case backend
    case hr
    case pr
    case backOffice = "back_office"
    case support
}

// MARK: - Localized Depertment

extension Department: CaseIterable {
    var title: String {
        switch self {
        case .all:
            return Resources.Strings.Department.all.localizedString
        case .design:
            return Resources.Strings.Department.design.localizedString
        case .analytics:
            return Resources.Strings.Department.analytics.localizedString
        case .management:
            return Resources.Strings.Department.management.localizedString
        case .ios:
            return Resources.Strings.Department.ios.localizedString
        case .android:
            return Resources.Strings.Department.android.localizedString
        case .qa:
            return Resources.Strings.Department.qa.localizedString
        case .frontend:
            return Resources.Strings.Department.frontend.localizedString
        case .backend:
            return Resources.Strings.Department.backend.localizedString
        case .hr:
            return Resources.Strings.Department.hr.localizedString
        case .pr:
            return Resources.Strings.Department.pr.localizedString
        case .backOffice:
            return Resources.Strings.Department.backOffice.localizedString
        case .support:
            return Resources.Strings.Department.support.localizedString
        }
    }
}
