//
//  ContentView.swift
//  TodoAppVlog
//
//  Created by Marina Beatriz Santana de Aguiar on 31.07.20.
//  Copyright © 2020 Marina Beatriz Santana de Aguiar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var todoText = ""
    @State private var showDeleteAlert = false
    @State private var deleteItemIndex: IndexSet?
    @ObservedObject var itemsManager = ItemsManager<String>()
    
    var body: some View {
        let allItems = { self.itemsManager.retrieveAllItems() }()
        
        return NavigationView {
            VStack {
                TextField("Insert todo. Eg.: Buy Apples", text: $todoText, onCommit: {
                    self.itemsManager.addNewItem(withContent: self.todoText)
                    self.todoText = ""
                })
                    .padding(.all)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                
                List {
                    ForEach(allItems, id: \.self) {
                        item in
                        Text(item)
                    }
                    .onDelete(perform: deleteItem)
                    .alert(isPresented: $showDeleteAlert, content: {
                        Alert(title: Text("Warning"),
                              message: Text("This item will be deleted"),
                              primaryButton: .cancel(),
                              secondaryButton: .destructive(Text("OK")) {
                                self.itemsManager.deleteItem(index: self.deleteItemIndex!)
                              })
                    })
                }
            }
            .navigationBarTitle("To Do")
        }
    }
    
    
    func deleteItem(index: IndexSet) {
        deleteItemIndex = index
        showDeleteAlert = true
    }
}

























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
