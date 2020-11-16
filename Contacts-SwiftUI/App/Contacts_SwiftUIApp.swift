//
//  Contacts_SwiftUIApp.swift
//  Contacts-SwiftUI
//
//  Created by Glenn Von Posadas on 10/10/20.
//

import SwiftUI

@main
struct Contacts_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContactListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
