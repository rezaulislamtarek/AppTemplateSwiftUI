//
//  FactoryDI.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import Factory
import EasyNet

extension Container {
   
    var easyNet : Factory<EasyNetProtocol> {
        self{
            EasyNet(baseUrl: BaseUrl().create())
        }
        .scope(.singleton)
    }
}
