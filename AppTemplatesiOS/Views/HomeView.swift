//
//  HomeView.swift
//  Hawamsh
//
//  Created by Rezaul Islam on 6/26/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var router : Router
    @State var showSplashView : Bool = true
    
    var body: some View {
        ZStack {
            if showSplashView {
                SplashView(isVisible: $showSplashView)
            }else{
                VStack {
                    Text("Home View")
                    Button("Click Me"){
                        router.push(.profile)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.pink.opacity(0.8))
    }
}

#Preview {
    HomeView()
        .environmentObject(Router())
}
