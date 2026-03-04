//
//  HomeView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var path: NavigationPath
    @StateObject private var viewModel = HomeViewModel()
    
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
                Button {
                    print("Camera tapped")
                } label: {
                    Image("leadingCameraImg")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("Notification tapped")
                } label: {
                    Image("trailingNotificationImg")
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
