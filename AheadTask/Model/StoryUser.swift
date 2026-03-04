//
//  StoryUser.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import Foundation


struct StoryUser: Identifiable,Hashable {
    let id = UUID()
    let name: String
    let image: String
    let isYou: Bool
}


extension StoryUser {
    static func getMockData() -> [StoryUser] {
        return [
            StoryUser(name: "You", image: "profileImg", isYou: true),
            StoryUser(name: "Benjamin", image: "profileImg", isYou: false),
            StoryUser(name: "Farita", image: "profileImg", isYou: false),
            StoryUser(name: "Marie", image: "profileImg", isYou: false),
            StoryUser(name: "Farita", image: "profileImg", isYou: false),
            StoryUser(name: "Marie", image: "profileImg", isYou: false),
        ]
    }
}
