//
//  ItemsManager.swift
//  TodoAppVlog
//
//  Created by Marina Beatriz Santana de Aguiar on 31.07.20.
//  Copyright © 2020 Marina Beatriz Santana de Aguiar. All rights reserved.
//

import Foundation

//ViewModel
class ItemsManager<Element>: ObservableObject {
    @Published var items = Items<Element>()
    
    func addNewItem(withContent content: Element) {
        //objectWillChange.send()
        items.appendToItems(withContent: content)
    }
    
    func deleteItem(index: IndexSet) {
        //objectWillChange.send()
        items.deleteItem(index: index)
    }
    
    func retrieveAllItems() -> [Items<Element>.Item<Element>] { items.getAllItems() }
}
