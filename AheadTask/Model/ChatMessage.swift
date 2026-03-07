//
//  ChatMessage.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import Foundation

struct ChatMessageModel: Identifiable,Hashable {
    let id = UUID()
    let text: String
    let isMe: Bool
}

extension ChatMessageModel {
    static func getChatMockData() -> [ChatMessageModel] {
        return [
            ChatMessageModel(text: "Hi Catherine ! How are you?", isMe: false),
            ChatMessageModel(text: "I'm good and you?", isMe: true),
            ChatMessageModel(text: "I'm doing good. What are you doing ?", isMe: false),
            ChatMessageModel(text: "I'm working on my app design.", isMe: true),
            ChatMessageModel(text: "Let's get lunch! How about sushi ?", isMe: false),
            ChatMessageModel(text: "That sounds great!", isMe: true),
            ChatMessageModel(text: "Hi Catherine ! How are you?", isMe: false),
            ChatMessageModel(text: "I'm good and you?", isMe: true),
            ChatMessageModel(text: "I'm doing good. What are you doing ?", isMe: false),
            ChatMessageModel(text: "I'm working on my app design.", isMe: true),
            ChatMessageModel(text: "Let's get lunch! How about sushi ?", isMe: false),
            ChatMessageModel(text: "That sounds great!", isMe: true),
        ]
    }
}
