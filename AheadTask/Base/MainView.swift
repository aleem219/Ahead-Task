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
                    case 1:
                        Text("Messages")
                    case 2:
                        Text("Notifications")
                    case 3:
                        Text("Profile")
                    case 4:
                        Text("Center")
                            .font(.headline)
                            .fontWeight(.bold)
                    default:
                        HomeView(path: $path)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                TabbarView(selectedIndex: $currentIndex)
                    .ignoresSafeArea(edges: .bottom)
            }
            
            .navigationDestination(for: StoryUser.self) { user in
                UserProfileView()
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    MainView()
}
