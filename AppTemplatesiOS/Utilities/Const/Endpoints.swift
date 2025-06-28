//
//  Endpoints.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

enum Endpoints{
    case questions
    
    var path: String{
        switch self {
        case .questions:
            return "/api/topics/1/questions"
        }
    }
}
