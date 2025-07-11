//
//  HDropdownPicker.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//

import SwiftUI

public struct Dropdown : Identifiable, Hashable {
    public let id = UUID()
    let title : String
    let value : String
}

struct AppDropdownPicker: View {
    var options : [Dropdown]
    var width : CGFloat = .infinity
    var height : CGFloat = 48
    @Binding var selectedItem : Dropdown
    
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectedItem = option
                }) {
                    Text(option.title)
                        .fontRegular(14)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        } label: {
            HStack {
                Text(selectedItem.title)
                    .fontRegular(14)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(.gray.opacity(0.2), lineWidth: 1)
            )
        }
        .frame(maxWidth: .infinity)
    }
         
    
}

struct AppDropdownPickerImp : View {
    @State var selectedItem : Dropdown = .init(title: "12 Months", value: "12")
    var options : [Dropdown] = [ Dropdown(title: "12 Months", value: "12"), Dropdown(title: "6 Months", value: "6"), Dropdown(title: "3 Months", value: "3"), Dropdown(title: "1 Month", value: "1") ]
    
    var body: some View {
         VStack {
             AppDropdownPicker(options: options, selectedItem: $selectedItem)
        }
    }
}

#Preview {
    AppDropdownPickerImp()
        .padding()
        .background(.white)
}
