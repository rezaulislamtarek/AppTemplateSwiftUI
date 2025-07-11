//
//  DetailsPopupView.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//

import SwiftUI

struct DetailsPopupView: View {
    @ObservedObject var vm : QuestionsViewModel
    var onComplete : (() -> Void)
    var body: some View {
        VStack{
            Text("Total Questions :\(vm.questions.count)")
            Button("Aggred"){
            
                onComplete()
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DetailsPopupView( vm: QuestionsViewModel() ){}
}
