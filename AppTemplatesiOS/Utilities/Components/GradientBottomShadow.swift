//
//  GradientBottomShadow.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//
import SwiftUI

struct GradientBottomShadow: View {
    var height: CGFloat = 8
    var colors: [Color] = [
        Color.gray.opacity(0.07),
        Color.gray.opacity(0.05),
        Color.gray.opacity(0.01),
        Color.clear
    ]
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: .top,
            endPoint: .bottom
        )
        .frame(height: height)
    }
}
