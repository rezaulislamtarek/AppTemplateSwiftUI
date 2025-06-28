//
//  QuizModel.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import Foundation

struct QuizResponse: Codable {
    let success: Bool
    let count: Int
    let topic: String
    let data: [QuizQuestion]
}

struct QuizQuestion: Codable, Identifiable, Hashable {
    let id: Int
    let question: String
    let options: [String]
    let answer: String
    let topicId: Int
    let explanation: String?
}
