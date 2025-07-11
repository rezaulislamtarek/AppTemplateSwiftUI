//
//  HTextField.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//

import SwiftUI

struct AppTextField: View {
    let label : String
    var width : CGFloat = .infinity
    var height : CGFloat = 48
    @Binding var text : String
    @FocusState private var isFocus: Bool
    var isMendotory : Bool = true
    @Binding var errorMessage : String?
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.grayf8F8F8)
                .frame(height: height)
                .shadow(
                    color: Color(hex: "#DEE3EA").opacity(isFocus ? 1 : 0),
                    radius: isFocus ? 10 : 0,
                    x: 0,
                    y: isFocus ? 2 : 0
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(isFocus ? .blue100 : .grayf8F8F8, lineWidth: 0.3)
                        .opacity(isFocus || !text.isEmpty ? 1 : 0)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(.red, lineWidth: 1)
                        .opacity(errorMessage == nil ? 0 : 1)
                }
                .overlay(alignment: .leading) {
                    HStack(spacing : 2){
                        Text(label)
                            //.padding(.leading, 4 )
                            .foregroundStyle(errorMessage != nil ? .red : isFocus ? .blue100 : Color(hex: "#475569"))
                            .fontRegular(14)
                        
                        Text("*")
                            .foregroundStyle(.red)
                            .opacity(isMendotory ? 1 : 0)
                    }.padding(.leading, 4)
                    
                    //                .background( isFocus || !text.isEmpty ? Color.white : .grayf8F8F8  )
                    .background(
                        Color.white
                            .frame(height: 2, alignment: .center )
                            .offset(y:1)
                            .opacity(isFocus || !text.isEmpty ? 1 : 0)
                    )
                    
                    .padding(8)
                    .offset(y: isFocus || !text.isEmpty ? -25 : 0)
                    .animation(.easeInOut(duration: 0.1), value: isFocus)
                }
                .overlay {
                    TextField("", text: $text)
                        .focused($isFocus)
                        .padding(.horizontal, 10)
                }
            if let errorMessage{
                Text("\(errorMessage)")
                    .fontRegular(12)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,4)
            }
        }
        .onChange(of: text) { newValue in
            errorMessage = nil
            print("Error Text \(newValue)")
        }
        
    }
          
}

struct HTextFieldImp : View {
    @State var text : String = ""
    @State var text2 : String = ""
    @State var errorMessage : String? = "Error occured"
    var body: some View {
        AppTextField(label: "ID Number or Iqama", text: $text, errorMessage: .constant(nil))
        AppTextField(label: "ID Number or Iqama", text: $text2, errorMessage: $errorMessage)
        
    }
}

#Preview {
    HTextFieldImp( )
        .fullHeightWidth()
        .padding()
        .background(.white)
}

