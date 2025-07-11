//
//  Logger.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//

import Foundation

struct Logger {
    enum LogLevel: String {
        case info = "INFO"
        case debug = "DEBUG"
        case warning = "WARNING"
        case error = "ERROR"
    }

    static func log(_ message:
                    Any, level: LogLevel = .info, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = (file as NSString).lastPathComponent
        let timestamp = Date().formatted()

        print("[\(timestamp)] [\(level.rawValue)] [\(fileName):\(line) - \(function)] \(message)")
    }
}

extension Date {
    func formatted() -> String {
        let formatter = DateFormatter()
        if #available(iOS 16, *) {
            formatter.locale = Locale()
        } else {
            // Fallback on earlier versions
            formatter.locale = .autoupdatingCurrent
        }
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: self)
    }
}

