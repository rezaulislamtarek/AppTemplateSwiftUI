//
//  HButton.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//


import SwiftUI

enum ButtonState {
    case active
    case loading
    case disabled
}

struct AppButton: View {
    let title: String
    var height: CGFloat = 52
    var state: ButtonState = .active
    var action: () -> Void
    
    var body: some View {
        Button {
            if state == .active {
                action()
            }
        } label: {
            HStack {
                if state == .loading {
                    ProgressView()
                        .scaleEffect(0.8)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
                
                Text(title)
                    .fontBold(14)
                    .opacity(state == .loading ? 0.7 : 1.0)
            }
            .frame(height: height)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(backgroundColor)
            )
        }
        .disabled(state != .active)
        .animation(.easeInOut(duration: 0.2), value: state)
    }
    
    private var backgroundColor: Color {
        switch state {
        case .active:
            return .blue
        case .loading:
            return .blue.opacity(0.8)
        case .disabled:
            return .gray.opacity(0.4)
        }
    }
}

 

#Preview {
    VStack(spacing: 20) {
        AppButton(title: "Active Button", state: .active) {}
        
        AppButton(title: "Loading...", state: .loading) {}
        
        AppButton(title: "Disabled Button", state: .disabled) {}
    }
    .padding()
}
