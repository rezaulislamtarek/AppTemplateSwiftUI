//
//  AppRoute.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 6/26/25.
//

import Foundation

enum AppRoute: Hashable, Equatable {
    case home
    case profile
    case settings
    case settingDetails(Int)
    case questions
    
    case detailsPopup( vm : QuestionsViewModel, onCompleted : () -> Void)
    case successPopup(onCompleted : () -> Void)
    
    static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        switch (lhs, rhs) {
        case (.home, .home), (.profile, .profile), (.settings, .settings), (.questions, .questions):
            return true
        case let (.settingDetails(a), .settingDetails(b)):
            return a == b
        case (.detailsPopup, .detailsPopup), (.successPopup, .successPopup):
            // Closures and ViewModels cannot be equated, so always return false or only compare the case.
            return false
        default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .home:
            hasher.combine(0)
        case .profile:
            hasher.combine(1)
        case .settings:
            hasher.combine(2)
        case .settingDetails(let id):
            hasher.combine(3)
            hasher.combine(id)
        case .questions:
            hasher.combine(4)
        case .detailsPopup:
            hasher.combine(5)
        case .successPopup:
            hasher.combine(6)
        }
    }
}
