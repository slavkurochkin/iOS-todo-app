//
//  LoginView.swift
//  ToDoList
//
//  Created by Slav Kurochkin on 6/23/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .pink)
            
                
                // Login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .accessibility(identifier: "emailInput")
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .accessibility(identifier: "passwordInput")
                    
                    TLButton(title: "Log in", background: .blue) {
                     // Attempt log in
                        viewModel.login()
                    }
                    .accessibility(identifier: "loginBtn")
                    .padding()
                    
                }
                .offset(y: -50)
                // Create account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                    }
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }


#Preview {
    LoginView()
}
