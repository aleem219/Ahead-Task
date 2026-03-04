//
//  ChatMessage.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isMe: Bool
}
