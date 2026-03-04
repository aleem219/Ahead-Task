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
