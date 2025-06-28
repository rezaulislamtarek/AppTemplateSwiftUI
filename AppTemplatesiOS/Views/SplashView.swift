//
//  SplashView.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 26/6/25.
//

import SwiftUI

struct SplashView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "iphone.gen1.crop.circle")
                .resizable()
                .frame(width: 80, height: 80)
                
            Text("AppTemplatesiOS")
                .fontBold(26)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isVisible = false
                }
            }
        }
    }
}

#Preview {
    SplashView(isVisible: .constant(false))
}
