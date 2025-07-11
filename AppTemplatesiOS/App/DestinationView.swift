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
        case .questions:
            QuestionsListView()
        case .detailsPopup(vm: let vm, onCompleted: let onCompleted):
            DetailsPopupView(vm: vm) {
                onCompleted()
            }
            .frame(width: 200, height: 200)
            .background(.white)
            .cornerRadius(24)
            
        case .successPopup(onCompleted: let onCompleted):
            SuccessPopupView {
                onCompleted()
            }
            .frame(maxWidth: .infinity)
            .padding(30)
            .background(.white)
            .cornerRadius(24)
            .padding()
            
        }
    }
}

#Preview {
    DestinationView(route: .home)
}
