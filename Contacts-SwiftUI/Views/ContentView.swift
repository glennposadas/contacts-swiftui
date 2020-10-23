//
//  ContentView.swift
//  Contacts-SwiftUI
//
//  Created by Glenn Von Posadas on 10/10/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var showingAlert = false
    @State private var deleteIndexSet: IndexSet!

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Contact.firstName, ascending: true)],
        animation: .default)
    private var contacts: FetchedResults<Contact>
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.contacts) { contact in
                    ContactRow(contact: contact)
                }
                .onDelete(perform: { indexSet in
                    self.deleteIndexSet = indexSet
                    self.showingAlert = true
                })
            }
            .alert(isPresented: self.$showingAlert) {
                // We can force unwrap here because you only show the alert after .onDelete
                let indexSet = self.deleteIndexSet!
                let name = self.contacts[indexSet.first!].firstName!
                return Alert(title: Text("Are you sure?"),
                      message: Text("Delete \(name)?"),
                      primaryButton: .default(Text("Cancel")),
                      secondaryButton: .cancel(Text("OK")) {
                        self.deleteItems(offsets: indexSet)
                      }
                )
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Contacts")
            .navigationBarItems(trailing: HStack {
                Button("Add", action: self.addItem)
            })
        }
    }
    
    private func addItem() {
        withAnimation {
            let newContact = Contact(context: viewContext)
            newContact.createdAt = Date()
            newContact.firstName = "lalala"
            newContact.lastName = "popopo"
            do {
                try self.viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { self.contacts[$0] }.forEach(self.viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
