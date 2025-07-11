//
//  View+Extensions.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import SwiftUI

extension View{
    
    func fullHeightWidth() -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func fullwidth(alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func onTapAsButton(_ action: @escaping () -> Void) -> some View {
         Button(action: action) {
            self
        }
    }
    
    func disableSwipeBack( ) -> some View {
        self.onAppear {
            NavState.shared.swipeEnabled = false
        }
        .onDisappear {
            NavState.shared.swipeEnabled = true
        }
    }
    
    func showBackgroundOverlay(_ isShow: Bool) -> some View {
        self.overlay {
            Color.black.opacity(0.4)
                .ignoresSafeArea(edges: .all)
                .opacity( isShow ? 1 : 0)
        }
    }
    
    func hideKeyboard() {UIApplication.shared.sendAction( #selector( UIResponder.resignFirstResponder ), to: nil, from: nil, for: nil)}
    
    func backToolBar(_ title : String? = "",  _ action : @escaping ()-> Void ) -> some View{
        self.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        action()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.black)
                    }
                    
                }
                
                ToolbarItem(placement: .principal) {
                    Text(title ?? "")
                        .fontBold(20)
                    
                }
            }
    }
}


let height = UIScreen.main.bounds.height
let width = UIScreen.main.bounds.width
