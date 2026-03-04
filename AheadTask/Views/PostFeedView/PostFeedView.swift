//
//  PostFeedView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct PostFeedView: View {
    
    let posts: [PostModel]
    var body: some View {
        VStack(spacing: 16) {
            ForEach(posts) { post in
                PostCardView(post: post)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    PostFeedView(posts: PostModel.getMockData())
}
