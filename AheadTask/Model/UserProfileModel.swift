//
//  UserProfileModel.swift
//  AheadTask
//
//  Created by Abdul Aleem on 03/03/26.
//
import Foundation

// MARK: - Photo Model
struct ProfilePhoto: Identifiable {
    let id: UUID
    let imageName: String
    
    init(id: UUID = UUID(), imageName: String) {
        self.id = id
        self.imageName = imageName
    }
}

// MARK: - UserProfile Model
struct UserProfileModel: Identifiable {
    let id: UUID
    let username: String
    let bio: String
    let followers: String
    let following: String
    let profileImage: String
    let headerImage: String
    let photos: [ProfilePhoto]
    
    init(
        id: UUID = UUID(),
        username: String,
        bio: String,
        followers: String,
        following: String,
        profileImage: String,
        headerImage: String,
        photos: [ProfilePhoto]
    ) {
        self.id = id
        self.username = username
        self.bio = bio
        self.followers = followers
        self.following = following
        self.profileImage = profileImage
        self.headerImage = headerImage
        self.photos = photos
    }
}

// MARK: - Mock Data
extension UserProfileModel {
    static let mock = UserProfileModel(
        username: "@Catherine13",
        bio: "My name is Catherine. I like dancing in the rain and travelling all around the world.",
        followers: "1k",
        following: "342",
        profileImage: "profileImg",
        headerImage: "backgroundImg",
        photos: [
            ProfilePhoto(imageName: "profileImg"),
            ProfilePhoto(imageName: "profileImg"),
            ProfilePhoto(imageName: "profileImg"),
            ProfilePhoto(imageName: "profileImg"),
            ProfilePhoto(imageName: "profileImg"),
            ProfilePhoto(imageName: "profileImg")
        ]
    )
}
