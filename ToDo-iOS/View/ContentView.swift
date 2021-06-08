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
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: ToDo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDo.name, ascending: true)]) var todos: FetchedResults<ToDo>
    
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(self.todos, id: \.self) { todo in
                    HStack {
                        Text(todo.name ?? "Unknown")
                        
                        Spacer()
                        
                        Text(todo.priority ?? "Unknown")
                    }
                } //: FOREACH
                .onDelete(perform: deleteTodo)
            } //: LIST
            .navigationBarTitle("ToDo", displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                                    Button(action: {
                                        self.showingAddTodoView.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                    } //: ADD BUTTON
                                    .sheet(isPresented: $showingAddTodoView) {
                                        AddToDoView().environment(\.managedObjectContext, self.managedObjectContext)
                                    }
            )
        } //: NAVIGATION
    }
    
    // MARK: - FUNCTIONS
    
    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            managedObjectContext.delete(todo)
            
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
