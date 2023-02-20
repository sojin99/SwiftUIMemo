//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by 권소진 on 2023/02/14.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    
    @StateObject var store = MemoStore()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}

