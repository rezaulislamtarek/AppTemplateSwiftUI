//
//  ConfigConstraints.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import Foundation

enum AppEnv{
    case dev
    case prod
    case uat
}

final class ConfigConstraints{
    static var environment : AppEnv = .dev
}
