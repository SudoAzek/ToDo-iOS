//
//  ContentView.swift
//  ToDo-iOS
//
//  Created by Azamat Ochilov on 2021/06/01.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("Hello, World!")
            } //: LIST
            .navigationBarTitle("ToDo", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingAddTodoView.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                    } //: ADD BUTTON
                                    .sheet(isPresented: $showingAddTodoView) {
                                        AddToDoView()
                                    }
            )
        } //: NAVIGATION
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
