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
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                Group {
                    switch currentIndex {
                    case 0: HomeView()
                    case 2: Text("Notifications")
                    case 3: Text("Notifications")
                    default: HomeView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                TabbarView(selectedIndex: $currentIndex)
            }
            .ignoresSafeArea(.all)
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(isPresented: $showMessage) {
                MessageView()
            }
            .onChange(of: currentIndex) {
                if currentIndex == 1 {
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
