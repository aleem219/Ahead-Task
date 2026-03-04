//
//  PostFeedView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct PostFeedView: View {
    
    let posts: [PostModel] = [
        PostModel(userName: "Claire Dangais", userHandle: "@ClaireD15", userImage: "profileImg", postImage: "profileImg", comments: 10, likes: 122),
        PostModel(userName: "Farita Smith", userHandle: "@SmithFa", userImage: "profileImg", postImage: "profileImg", comments: 5, likes: 98),
        PostModel(userName: "Claire Dangais", userHandle: "@ClaireD15", userImage: "profileImg", postImage: "profileImg", comments: 10, likes: 122),
        PostModel(userName: "Farita Smith", userHandle: "@SmithFa", userImage: "profileImg", postImage: "profileImg", comments: 5, likes: 98),
        PostModel(userName: "Claire Dangais", userHandle: "@ClaireD15", userImage: "profileImg", postImage: "profileImg", comments: 10, likes: 122),
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                ForEach(posts) { post in
                    PostCardView(post: post)
                }
            }
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    PostFeedView()
}
