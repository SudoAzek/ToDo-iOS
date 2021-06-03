//
//  AddToDoView.swift
//  ToDo-iOS
//
//  Created by Azamat Ochilov on 2021/06/01.
//


import SwiftUI

struct AddToDoView: View {
    // MARK - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - TODO NAME
                    TextField("ToDo", text: $name)
                    
                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // MARK: - SAVE BUTTON
                    Button(action: {
                        print("Save a new ToDo item.")
                    }, label: {
                        Text("Save")
                    }) //: SAVE BUTTON
                } //: FORM
                
                Spacer()
            }//: VSTACK
            .navigationBarTitle("New ToDo", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                            self.presentationMode.wrappedValue.dismiss()
                                        
                                    }) {
                                        Image(systemName: "xmark")
                                    }
            )
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView().previewDevice("iPhone 12 Pro")
        
    }
}
