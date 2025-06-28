//
//  BaseURLMaker.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import Foundation

protocol BaseURLFactoryProtocol{
    func createBaseURL() -> String
}

class DevBaseURL : BaseURLFactoryProtocol{
    func createBaseURL() -> String{
        return "https://iosquizv2.smartbancharampur.com"
    }
}

class ProdBaseURL : BaseURLFactoryProtocol{
    func createBaseURL() -> String{
        //Need to fix correct endpoint for prod and uat
        return "https://iosquizv2.smartbancharampur.com"
    }
}

class UATBaseURL : BaseURLFactoryProtocol{
    func createBaseURL() -> String{
        return "https://iosquizv2.smartbancharampur.com"
    }
}

protocol BaseURLProtocol{
    func create() -> String
}

class BaseUrl : BaseURLProtocol{
    func create() -> String {
        switch ConfigConstraints.environment{
        case .prod:
            return ProdBaseURL().createBaseURL()
            
        case .dev:
            return DevBaseURL().createBaseURL()
            
        case .uat:
            return UATBaseURL().createBaseURL()
        }
    }
}
