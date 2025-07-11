
//
//  HSecureField.swift
//  Hawamsh
//
//  Created by Rezaul Islam on 7/1/25.
//

import SwiftUI


struct HSecureField: View {
    let label : String
    var width : CGFloat = .infinity
    var height : CGFloat = 48
    @Binding var text : String
    @FocusState private var isFocus: Bool
    var isMendotory : Bool = true
    @Binding var errorMessage : String?
    @State private var showPassword : Bool = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.gray.opacity(0.1))
                .frame(height: height)
                .shadow(
                    color: Color(hex: "#DEE3EA").opacity(isFocus ? 1 : 0),
                    radius: isFocus ? 10 : 0,
                    x: 0,
                    y: isFocus ? 2 : 0
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                    //                        .stroke(isFocus ? .blue100 : .gray, lineWidth: 1)
                        .stroke(isFocus ? .blue : .gray.opacity(0.1), lineWidth: 0.3)
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
                            .foregroundStyle(errorMessage != nil ? .red : isFocus ? .blue : .black)
                            .fontRegular(14)
                        
                        Text("*")
                            .foregroundStyle(.red)
                            .opacity(isMendotory ? 1 : 0)
                    }.padding(.leading, 4)
                        .background(
                            Color.white
                                .frame(height: 2, alignment: .center)
                                .offset(y: 1)
                                .opacity(isFocus || !text.isEmpty ? 1 : 0)
                        )
                    
                        .padding(8)
                        .offset(y: isFocus || !text.isEmpty ? -25 : 0)
                        .animation(.easeInOut(duration: 0.1), value: isFocus)
                }
                .overlay {
                    ZStack {
                        TextField("", text: $text)
                            .focused($isFocus)
                            .padding(.horizontal, 10)
                            .opacity(showPassword ? 1 : 0)
                        
                        SecureField("", text: $text)
                            .focused($isFocus)
                            .padding(.horizontal, 10)
                            .opacity(showPassword ? 0 : 1)
                        
                    }
                    .padding(.trailing, 38)
                    .overlay(alignment: .trailing) {
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye" : "eye.slash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22, alignment: .center)
                                .foregroundStyle(.black)
                            
                        }
                        .padding(.trailing, 13)
                        
                    }
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

struct HSecureFieldImp : View {
    @State var text : String = ""
    @State var text2 : String = ""
    @State var errorMessage : String? = "Error occured"
    var body: some View {
        HSecureField(label: "Password", text: $text, errorMessage: .constant(nil))
        HSecureField(label: "Password", text: $text2, errorMessage: $errorMessage)
        
    }
}

#Preview {
    HSecureFieldImp( )
        .fullHeightWidth()
        .padding()
        .background(.white)
}
