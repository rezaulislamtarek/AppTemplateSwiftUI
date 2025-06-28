//
//  View+Extensions.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import SwiftUI

extension View{
    
    

    func disableSwipeBack( ) -> some View {
        self.onAppear {
            NavState.shared.swipeEnabled = false
        }
        .onDisappear {
            NavState.shared.swipeEnabled = true
        }
    }
    
    func hideKeyboard() {UIApplication.shared.sendAction( #selector( UIResponder.resignFirstResponder ), to: nil, from: nil, for: nil)}
}


