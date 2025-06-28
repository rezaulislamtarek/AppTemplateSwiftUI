//
//  QuestionsListView.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 28/6/25.
//

import SwiftUI

struct QuestionsListView: View {
    @EnvironmentObject private var router : Router
    @StateObject private var viewModel = QuestionsViewModel()
    var body: some View {
        VStack(){
            List(selection: .constant("Questions list") ) {
                ForEach(viewModel.questions, id: \.self) { question in
                    VStack (alignment: .leading){
                        Text(question.question)
                            .fontRegular(18)
                        Text(question.answer)
                            .fontRegular()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(12)
                            .background(.green.opacity(0.06))
                            .foregroundStyle(.green)
                            .cornerRadius(16)
                        
                    }
                }
            }
        
        }
        .overlay(content: {
            ProgressView()
                .opacity(viewModel.isLoading ? 1 : 0)
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .hideNavigationBar(false)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "arrow.left")
                    .onTapGesture {
                        router.pop()
                    }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Questions")
                    .fontMedium(24)
            }
        }
        
    }
}

#Preview {
    QuestionsListView()
}
