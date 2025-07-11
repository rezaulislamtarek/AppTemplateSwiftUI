//
//  SuccessPopupView.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//

import SwiftUI

struct SuccessPopupView: View {
    var onCompleted: () -> Void
    var body: some View {
        VStack(spacing:20){
            Image(systemName: "checkmark.seal.fill")
            Text("Congratulations!")
                .fontBold(30)
            Text("Your order has been placed successfully. We will contact you soon. Thank you!")
                .fontRegular(18)
            Button("Done"){
                onCompleted()
            }.buttonStyle(.bordered)
        }
         
    }
}

#Preview {
    SuccessPopupView(){}
}
