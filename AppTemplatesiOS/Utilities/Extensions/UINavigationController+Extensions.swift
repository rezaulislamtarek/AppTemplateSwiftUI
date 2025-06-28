//
//  UINavigationController+Extensions.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import Foundation
import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if NavState.shared.swipeEnabled {
            return viewControllers.count > 1
        }
        return false
    }
    
}
