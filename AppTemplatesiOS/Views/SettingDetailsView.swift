//
//  SettingDetails.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 26/6/25.
//

import SwiftUI

struct SettingDetailsView : View {
    @EnvironmentObject private var router : Router
    
    let id : Int
    
    var body: some View {
        VStack {
            Text("Setting Details")
            Text("ID: \(id)")
            Button("Back to profile View"){
                router.popTo(.profile)
            }
        }
    }
}

#Preview{
    SettingView()
}
