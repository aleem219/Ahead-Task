//
//  ChatMessageViewModel.swift
//  AheadTask
//
//  Created by Abdul Aleem on 05/03/26.
//

import Foundation


final class ChatMessageViewModel:ObservableObject {
    
    @Published var chats: [ChatMessageModel] = []
    
    func getUsers() {
        chats  =  ChatMessageModel.getChatMockData()
    }
}
