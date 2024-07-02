//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Slav Kurochkin on 6/23/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// ViewModel for signle to do item view (each row item list)
class ToDoListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
