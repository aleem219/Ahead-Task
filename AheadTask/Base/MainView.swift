//
//  MainView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct MainView: View {
    
    @State private var currentIndex: Int = 0
    @State private var showMessage: Bool = false
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            
            ZStack(alignment: .bottom) {
                Color(.systemBackground)
                Group {
                    switch currentIndex {
                    case 0:
                        HomeView(path: $path)
                    case 2:
                        Text("Notifications")
                    case 3:
                        Text("Profile")
                    default:
                        HomeView(path: $path)
                    }
                }
                
                TabbarView(selectedIndex: $currentIndex)
                    .ignoresSafeArea(edges: .bottom)
            }
            
            .navigationDestination(for: StoryUser.self) { user in
                UserProfileView()
//                    .navigationBarBackButtonHidden(true)
            }
            
            .ignoresSafeArea(edges: .bottom)
            
            
            .navigationDestination(isPresented: $showMessage) {
                MessageView()
            }
            
            .onChange(of: currentIndex) { oldValue, newValue in
                if newValue == 1 {
                    showMessage = true
                    currentIndex = 0
                }
            }
        }
    }
}

#Preview {
    MainView()
}
