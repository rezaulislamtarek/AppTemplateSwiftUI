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
            HStack{
                VStack(alignment:.leading,spacing: 12) {
                    Text("My Profile")
                        .fontMedium(26)
                    Text("Enjoying the profile view here")
                }
                Spacer()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 44, height: 44)
                
            }
            .padding(.horizontal)
            .padding(.vertical)
            .background(.yellow.opacity(0.3))
            .cornerRadius(24)
            .padding(.horizontal)
            Spacer()
            Text("Profile View")
            Button("Click Me"){
                router.push(.settings)
            }
        }
        .fontRegular()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .hideNavigationBar(true)
        .disableSwipeBack()
        
        
         
    }
}

#Preview {
    ProfileView()
        .environmentObject(Router())
}


