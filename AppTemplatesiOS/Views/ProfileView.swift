//
//  ProfileView.swift
//  Hawamsh
//
//  Created by Rezaul Islam on 6/26/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var router : Router
    var body: some View {
        VStack {
            Text("Profile View")
            Button("Click Me"){
                router.push(.settings)
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(Router())
}


