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
                VStack (spacing: 12 ){
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text("Home View")
                    Button("Click Me"){
                        router.push(.profile)
                    }
                    .buttonBorderShape(.capsule)
                }
                .fontRegular(18)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }
}

#Preview {
    HomeView()
        .environmentObject(Router())
}
