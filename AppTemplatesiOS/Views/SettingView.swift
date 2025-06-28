//
//  SettingView.swift
//  Hawamsh
//
//  Created by Rezaul Islam on 6/26/25.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject private var router : Router
    var body: some View {
        VStack {
            Text("Setting View")
            Button("Go to setting Detials"){
                router.push(.settingDetails(101))
            }
            Button("Back to root"){
                router.popToRoot()
            }
        }
        .fontRegular(20)
        .hideNavigationBar(false)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.pop()
                } label: {
                    HStack{
                        Image(systemName: "arrow.left")
                        Text("Back")
                    }
                    .fontMedium(16)
                }

            }
            ToolbarItem(placement: .navigation) {
                Text("Setting View")
                    .fontRegular(16)
            }
        }
    }
}

#Preview {
    SettingView()
}
