//
//  Font+Extensions.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import SwiftUI

extension View{
    func fontRegular(_ size: CGFloat = 16) -> some View{
        self.font(.custom("AvenirNextRoundedStd-Reg", size: size))
    }
    
    func fontMedium(_ size: CGFloat = 15) -> some View{
        self.font(.custom("AvenirNextRoundedStd-Med", size: size))
    }
    
    func fontBold(_ size : CGFloat = 16) -> some View{
        self.font(.custom("AvenirNextRoundedStd-Bold", size: size))
    }
}
