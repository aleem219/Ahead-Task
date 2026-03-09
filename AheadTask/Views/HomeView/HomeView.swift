//
//  HomeView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var path: NavigationPath
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                StoriesRowView(stories: viewModel.stories, path: $path)
                    .padding(.top, 8)
                PostFeedView(posts: viewModel.posts)
            }
        }
        .onAppear(perform: {
            viewModel.getUsers()
            viewModel.getPost()
        })
        .background(Color(.systemBackground))
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CommonToolbarButton(icon: .asset("leadingCameraImg")) {
                    print("Back")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                CommonToolbarButton(icon: .asset("trailingNotificationImg")) {
                    print("Back")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomePreviewWrapper()
    }
}

struct HomePreviewWrapper: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        HomeView(path: $path)
    }
}
