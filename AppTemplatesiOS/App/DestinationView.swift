//
//  DestinationView.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 26/6/25.
//

import SwiftUI

struct DestinationView: View {
    let route: AppRoute
    
    var body: some View {
        switch route {
        case .home:
            HomeView()
        case .profile:
            ProfileView()
        case .settings:
            SettingView()
        case .settingDetails(let id):
            SettingDetailsView(id: id)
        }
    }
}

#Preview {
    DestinationView(route: .home)
}
