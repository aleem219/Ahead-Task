//
//  UserProfileDetailModel.swift
//  AheadTask
//
//  Created by Abdul Aleem on 05/03/26.
//

import Foundation

struct UserProfileDetailModel: Identifiable {
    let id = UUID()
    let userName: String
    let bio: String
    let followerList: String
    let followingList: String
    let profileAvatar:String
    let photos: [String]
}


extension UserProfileDetailModel {
    static func getUserProfileDetailData() -> [UserProfileDetailModel] {
        return [
            UserProfileDetailModel(userName: "Abdul Aleem", bio: "I am a man who drinks tea", followerList: "2K", followingList: "500", profileAvatar: "profileImg", photos: ["profileImg","profileImg","profileImg","profileImg","profileImg","profileImg","profileImg","profileImg","profileImg","profileImg","profileImg","profileImg"])
        ]
    }
}
