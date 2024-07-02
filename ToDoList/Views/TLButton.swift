//
//  TLButton.swift
//  ToDoList
//
//  Created by Slav Kurochkin on 6/23/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action:() -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", background: .pink){
        // Action
    }
}
