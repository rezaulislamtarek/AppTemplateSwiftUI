//
//  NavView+Extension.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hideNavigationBar(_ condition: Bool) -> some View {
            if condition {
                if #available(iOS 16.0, *) {
                    self.toolbar(.hidden, for: .navigationBar)
                } else {
                    self.navigationBarHidden(true)
                }
            } else {
                if #available(iOS 16.0, *) {
                    self.toolbar(.visible, for: .navigationBar)
                } else {
                    self.navigationBarHidden(false)
                }
            }
        }

}
