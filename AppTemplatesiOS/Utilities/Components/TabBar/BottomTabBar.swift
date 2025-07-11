//
//  BottomTabBar.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//

import SwiftUI

struct CustomBottomTabBarView: View {
    @EnvironmentObject private var router: Router
    let tabs: [TabBarItem]
    @State private var selectedIndex: Int = 0
    @Namespace private var animation
    
    init(@TabBarBuilder builder: () -> [TabBarItem]) {
        self.tabs = builder()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Main content area
            ZStack {
                ForEach(0..<tabs.count, id: \.self) { index in
                    tabs[index].view
                        .opacity(selectedIndex == index ? 1 : 0)
                        .animation(.easeInOut(duration: 0.2), value: selectedIndex)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            GradientBottomShadow()
            // Bottom Tab Bar
            HStack(spacing: 0) {
                
                ForEach(0..<tabs.count, id: \.self) { index in
                    TabButton(
                        tab: tabs[index],
                        isSelected: selectedIndex == index,
                        namespace: animation
                    ) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            selectedIndex = index
                        }
                    }
                }
            }
            //.padding(.horizontal, 16)
            .padding(.top, 12)
        }
    }
}

struct TabButton: View {
    let tab: TabBarItem
    let isSelected: Bool
    let namespace: Namespace.ID
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                ZStack {
                    // Background indicator with matched geometry effect
                    if isSelected {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.blue.opacity(0.1))
                            .frame(width: 50, height: 32)
                            .matchedGeometryEffect(id: "selectedTab", in: namespace)
                    }
                    
                    // Icon
                    Image( systemName: tab.icon)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(isSelected ? .blue : .clear)
                        .frame(width: 24, height: 24)
                }
                
                // Label
                Text(tab.title)
                    .fontBold(12)
                    .foregroundColor(isSelected ? .blue : .gray)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TabBarItem {
    let icon: String
    let title: String
    let view: AnyView
}

@resultBuilder
struct TabBarBuilder {
    static func buildBlock(_ components: TabBarItem...) -> [TabBarItem] {
        components
    }
}

