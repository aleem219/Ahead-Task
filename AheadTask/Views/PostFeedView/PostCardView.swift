//
//  PostCardView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct PostCardView: View {
    let post: PostModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(spacing: 12) {
                Image(post.userImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(post.userName)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(post.userHandle)
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            
            ZStack(alignment: .bottom) {
                
                Image(post.postImage)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 8)
                
                // Gradient Layer (missing layer)
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.clear,
                        Color.black.opacity(0.3)
                    ]),
                    startPoint: .trailing,
                    endPoint: .trailing
                )
                .frame(height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 8)
                
                // Buttons
                HStack {
                    HStack(spacing: 6) {
                        Image("imgMsg")
                            .foregroundColor(.white)
                        Text("\(post.comments)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .black))
                    }
                    
                    HStack(spacing: 6) {
                        Image("imgHeart")
                            .foregroundColor(.white)
                        Text("\(post.likes)")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .black))
                    }
                    
                    Spacer()
                    
                    Image("imgPaperPlane")
                        .foregroundColor(.white)
                    
                    Image("imgBookMark")
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
            }
            .padding(.bottom,15)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(#colorLiteral(red: 0.9019607843, green: 0.9333333333, blue: 0.9803921569, alpha: 1)))
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    PostCardView(post: PostModel(
        userName: "Claire Dangais",
        userHandle: "@ClaireD15",
        userImage: "profileImg",
        postImage: "profileImg",
        comments: 10,
        likes: 122
    ))
}
