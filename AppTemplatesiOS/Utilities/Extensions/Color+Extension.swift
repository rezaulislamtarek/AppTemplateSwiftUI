//
//  Color.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//

import SwiftUI

public extension Color {
    /// Creates a color from a hex string (e.g., "#FF0000" or "FF0000").
    /// - Parameter hex: A hex string representing the color.
    /// - Parameter opacity: The opacity of the color (default is 1.0).
    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255 * opacity
        )
    }
    
    /// Creates a color from a hex value (e.g., 0xFF0000).
    /// - Parameter hex: A hex value representing the color.
    /// - Parameter opacity: The opacity of the color (default is 1.0).
    init(hex: UInt, opacity: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: opacity
        )
    }
}

// MARK: - Common Colors
extension Color {
    // MARK: - Primary Colors
    static let primary = Color(hex: "#007AFF")
    static let primaryDark = Color(hex: "#0066CC")
    static let primaryLight = Color(hex: "#4DA3FF")

    // MARK: - Text Colors
    static let textPrimary = Color(hex: "#000000")
    static let textSecondary = Color(hex: "#666666")
    static let textTertiary = Color(hex: "#999999")
    static let textOnPrimary = Color.white

    // MARK: - Background Colors
    static let background = Color(hex: "#FFFFFF")
    static let backgroundSecondary = Color(hex: "#F8F8F8")
    static let backgroundTertiary = Color(hex: "#F0F0F0")

    // MARK: - System Colors
    static let error = Color(hex: "#FF3B30")
    static let success = Color(hex: "#34C759")
    static let warning = Color(hex: "#FF9500")
    static let info = Color(hex: "#5AC8FA")

    // MARK: - Gray Scale
    static let gray100 = Color(hex: "#F8F8F8")
    static let gray200 = Color(hex: "#F0F0F0")
    static let gray300 = Color(hex: "#E0E0E0")
    static let gray400 = Color(hex: "#CCCCCC")
    static let gray500 = Color(hex: "#999999")
    static let gray600 = Color(hex: "#666666")
    static let gray700 = Color(hex: "#333333")
    static let black100 = Color(hex: "#000000")

    // MARK: - Semantic Colors
    static let border = gray300
    static let shadow = Color.black.opacity(0.1)
    static let overlay = Color.black.opacity(0.5)

    // MARK: - Project Specific Colors
    // Add any project-specific color constants here
    static let accent = Color(hex: "#FF2D55")
    static let highlight = Color(hex: "#FFE600")
}

// MARK: - Color Palette
extension Color {
    // Add your color palette here
    static let red100 = Color(hex: "#FF3B30")
    static let orange100 = Color(hex: "#FF9500")
    static let yellow100 = Color(hex: "#FFCC00")
    static let green100 = Color(hex: "#34C759")
    static let teal100 = Color(hex: "#5AC8FA")
    static let blue100 = Color(hex: "#007AFF")
    static let indigo100 = Color(hex: "#5856D6")
    static let purple100 = Color(hex: "#AF52DE")
    static let pink100 = Color(hex: "#FF2D55")
}

// MARK: - Deprecated Colors
// These are kept for backward compatibility
@available(*, deprecated, renamed: "gray100")
extension Color {
    static let grayf8F8F8 = gray100
}
