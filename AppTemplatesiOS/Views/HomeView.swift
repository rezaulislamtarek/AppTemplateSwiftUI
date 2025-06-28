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
                VStack (spacing: 32 ){
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    Button {
                        router.push(.questions)
                    } label: {
                        VStack(alignment : .leading, spacing : 4){
                            HStack {
                                Text("Tap here")
                                    .fontBold()
                                Spacer()
                                Image(systemName: "hand.tap")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 34, height: 34)
                            }
                            Text("Want to exercerise iOS questions?")
                                .fontRegular(18)
                        }
                        .padding(24)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(24)
                        .padding()
                    }

                    
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
