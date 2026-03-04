//
//  MainView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct MainView: View {
    
    @State private var currentIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                Group {
                    switch currentIndex {
                    case 0: HomeView()
                    case 1: Text("Messages")
                    case 2: Text("Messages")
                    case 3: Text("Notifications")
                    default: Text("Messages")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                TabbarView(selectedIndex: $currentIndex)
            }
            .ignoresSafeArea(.all)
            .toolbar(.hidden, for: .navigationBar) 
        }
    }
}

#Preview {
    MainView()
}
