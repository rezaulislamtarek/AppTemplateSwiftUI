//
//  AppTemplatesiOSApp.swift
//  AppTemplates
//
//  Created by Rezaul Islam on 6/26/25.
//

import SwiftUI
import UIPilot

@main
struct AppTemplatesiOSApp: App {
    
    @StateObject private var router = Router()
    @StateObject private var pilot = UIPilot(initial: AppRoute.home)
    
    var body: some Scene {
        WindowGroup {
            AppContainerView()
                .environmentObject(router)
                .environmentObject(pilot)
                .onAppear {
                    setupRouter()
                }
        }
    }
    
    private func setupRouter() {
        guard #unavailable(iOS 16.0) else { return }
        router.setNavigationService(pilot)
    }
}
