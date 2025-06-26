//
//  HomeView.swift
//  Hawamsh
//
//  Created by Rezaul Islam on 6/26/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var router : Router
    var body: some View {
        VStack {
            Text("Home View")
            Button("Click Me"){
                router.push(.profile)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Router())
}
