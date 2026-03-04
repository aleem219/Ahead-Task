//
//  PostModel.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import Foundation

struct PostModel: Identifiable {
    let id = UUID()
    let userName: String
    let userHandle: String
    let userImage: String
    let postImage: String
    let comments: Int
    let likes: Int
}


extension PostModel {
    static func getMockData() -> [PostModel] {
        return [
            PostModel(userName: "Claire Dangais", userHandle: "@ClaireD15", userImage: "profileImg", postImage: "profileImg", comments: 10, likes: 122),
            PostModel(userName: "Farita Smith", userHandle: "@SmithFa", userImage: "profileImg", postImage: "profileImg", comments: 5, likes: 98),
            PostModel(userName: "Claire Dangais", userHandle: "@ClaireD15", userImage: "profileImg", postImage: "profileImg", comments: 10, likes: 122),
            PostModel(userName: "Farita Smith", userHandle: "@SmithFa", userImage: "profileImg", postImage: "profileImg", comments: 5, likes: 98),
            PostModel(userName: "Claire Dangais", userHandle: "@ClaireD15", userImage: "profileImg", postImage: "profileImg", comments: 10, likes: 122),
        ]
        
    }
}
