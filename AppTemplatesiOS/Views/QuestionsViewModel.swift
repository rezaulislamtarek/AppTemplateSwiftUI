//
//  QuestionsViewModel.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import Combine
import Factory

final class QuestionsViewModel : ObservableObject {
    @Injected(\.easyNet) var easyNet
    @Published var questions: [QuizQuestion] = []
    var cancellable = Set<AnyCancellable>()
    @Published var isLoading = false
    
    init(){
        fetchQuestions()
    }
    
    private func fetchQuestions(){
        isLoading = true
        easyNet.fetchData(endPoint: Endpoints.questions.path, responseType: QuizResponse.self, extraHeaders: nil)
            .sink { comp in
                self.isLoading = false
            } receiveValue: { [weak self] res in
                self?.questions = res.data
            }
            .store(in: &cancellable)
    }
}
