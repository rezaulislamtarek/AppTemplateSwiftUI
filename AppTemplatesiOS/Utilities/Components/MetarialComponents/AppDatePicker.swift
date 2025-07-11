//
//  AppDatePicker.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//
 

import SwiftUI

struct AppDatePicker: View {
    let label : String
    var width : CGFloat = .infinity
    var height : CGFloat = 48
    @State var selected : Bool = false
    @State private var isFocus: Bool = false {
        didSet{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                isFocus = false
            }
        }
    }
    var isMendotory : Bool = true
    @Binding var errorMessage : String?
    @Binding var date : Date?
    @State var selectedDate : Date = Date()
    @State private var showingDatePicker = false
    
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.gray.opacity(0.1))
                .frame(height: height)
            
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(isFocus ? .blue : .gray.opacity(0.1), lineWidth: 0.3)
                        .opacity(isFocus || selected  ? 1 : 0)
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
                    
                    //                .background( isFocus || !text.isEmpty ? Color.white : .grayf8F8F8  )
                    .background(
                        Color.white
                            .offset(y: -7)
                            .opacity(isFocus || selected  ? 1 : 0)
                    )
                    .padding(8)
                    .offset(y: isFocus || selected  ? -25 : 0)
                    .animation(.easeInOut(duration: 0.1), value: isFocus)
                }
                .overlay {
                    Text(selectedDate, style: .date)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 10)
                        .opacity(selected ? 1 : 0)
                }
                .overlay(alignment: .trailing) {
                    Image("calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22, alignment: .center)
                        .padding(.horizontal)
                }
            if let errorMessage{
                Text("\(errorMessage)")
                    .fontRegular(12)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal,4)
            }
        }
        .onChange(of: selectedDate) { newValue in
            date = newValue
            errorMessage = nil
            print("Error Text \(newValue)")
        }
        .onTapGesture(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
                isFocus = false
            }
            showingDatePicker = true
        })
        .sheet(isPresented: $showingDatePicker) {
            DatePickerSheet(selectedDate: $selectedDate, isPresented: $showingDatePicker, doneButtonClicked: $selected)
                }
        
    }
         
    
}

#Preview {
    AppDatePicker(label: "Date of birth", errorMessage: .constant(nil), date: .constant(Date()) )
}


struct DatePickerSheet: View {
    @Binding var selectedDate: Date
    @Binding var isPresented: Bool
    @Binding var doneButtonClicked : Bool
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker(
                    "Select Date",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
                .datePickerStyle(.graphical)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Select Date")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        doneButtonClicked = true
                        isPresented = false
                    }
                     
                }
            }
        }
        .preferredColorScheme(.light)
      
    }
}
