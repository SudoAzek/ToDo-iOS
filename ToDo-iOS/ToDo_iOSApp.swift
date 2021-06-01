//
//  ToDo_iOSApp.swift
//  ToDo-iOS
//
//  Created by Azamat Ochilov on 2021/06/01.
//

import SwiftUI

@main
struct ToDo_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
