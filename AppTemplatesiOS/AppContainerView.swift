//
//  ContentView.swift
//  AppTemplatesiOSApp
//
//  Created by Rezaul Islam on 6/26/25.
//

import SwiftUI
import UIPilot



@available(iOS 16.0, *)
struct NavigationStackContentView: View {
    @EnvironmentObject var router: Router
    @StateObject private var coordinator = NavigationCoordinator()
    
    
    var body: some View {
        NavigationStack(path: $coordinator.navPath) {
            HomeView()
                .navigationDestination(for: AppRoute.self) { route in
                    DestinationView(route: route)
                }
        }
        .onAppear{
            router.setNavigationService(coordinator)
        }
    }
    
}


struct UIPilotContentView: View {
    @EnvironmentObject var router: Router
    @EnvironmentObject var pilot: UIPilot<AppRoute>
    
    var body: some View {
        UIPilotHost(pilot) { route in
            DestinationView(route: route)
        }
    }
}


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


struct AppContainerView: View {
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStackContentView()
        } else {
            UIPilotContentView()
        }
    }
    
}

#Preview {
    AppContainerView()
        .environmentObject(Router())
}
