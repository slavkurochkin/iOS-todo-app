//
//  ContentView.swift
//  ToDoList
//
//  Created by Slav Kurochkin on 6/22/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
        
        var body: some View {
            // if CommandLine.arguments.contains("--uitesting") {
            //    viewModel.helperLogOut
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                accountView
            } else {
                LoginView()
            }
        }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }.accessibility(identifier: "homeTab")
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }.accessibility(identifier: "profileTab")
        }
    }
}

#Preview {
    MainView()
}
