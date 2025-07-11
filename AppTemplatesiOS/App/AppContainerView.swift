//
//  ContentView.swift
//  AppTemplatesiOSApp
//
//  Created by Rezaul Islam on 6/26/25.
//

import SwiftUI
import UIPilot


struct AppContainerView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStackContentView()
                .overlay {
                    setUpOverlay()
                }
        } else {
            UIPilotContentView()
                .overlay {
                    setUpOverlay()
                }
        }
    }
    
    func setUpOverlay() -> some View{
        ZStack{
            if router.isPopupVisible {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .animation(.easeInOut(duration: 0.3), value: router.isPopupVisible)
                    .onTapGesture {
                        router.hidePopup()
                    }
            }
            
            if router.isPopupVisible,
               let popupRoute = router.currentPopupRoute {
                DestinationView(route: popupRoute)
                    //.transition(.scale.combined(with: .opacity))
            }
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
                
        }.edgesIgnoringSafeArea(.all)
    }
}
