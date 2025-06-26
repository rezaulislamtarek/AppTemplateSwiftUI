//
//  ContentView.swift
//  AppTemplatesiOSApp
//
//  Created by Rezaul Islam on 6/26/25.
//

import SwiftUI
import UIPilot


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
