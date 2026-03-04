//
//  StoryUser.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import Foundation


struct StoryUser: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let isYou: Bool
}
