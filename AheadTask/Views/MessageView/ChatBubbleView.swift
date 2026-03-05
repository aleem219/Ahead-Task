//
//  ChatBubbleView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct ChatBubbleView: View {
    let message: ChatMessageModel
    
    var body: some View {
        HStack {
            if message.isMe { Spacer() }
            
            Text(message.text)
                .font(.system(size: 15))
                .foregroundColor(message.isMe ? .white : .black)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(message.isMe ? Color(#colorLiteral(red: 0.3411764706, green: 0.5647058824, blue: 0.8745098039, alpha: 1)) : Color.white)
                .cornerRadius(20)
            
            if !message.isMe { Spacer() }
        }
    }
}

#Preview {
    ChatBubbleView(message: ChatMessageModel(text: "Hello!", isMe: false))
}
