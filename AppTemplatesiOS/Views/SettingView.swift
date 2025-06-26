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
    }
}

#Preview {
    SettingView()
}
