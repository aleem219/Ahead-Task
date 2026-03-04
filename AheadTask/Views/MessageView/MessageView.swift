//
//  MessageView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct MessageView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var messageText: String = ""
    
    let messages: [ChatMessage] = [
        ChatMessage(text: "Hi Catherine ! How are you?", isMe: false),
        ChatMessage(text: "I'm good and you?", isMe: true),
        ChatMessage(text: "I'm doing good. What are you doing ?", isMe: false),
        ChatMessage(text: "I'm working on my app design.", isMe: true),
        ChatMessage(text: "Let's get lunch! How about sushi ?", isMe: false),
        ChatMessage(text: "That sounds great!", isMe: true),
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            
            // Background image
            backGroundImage
            
            // Main card
            VStack(spacing: 0) {
                Color.clear.frame(height: 64)
                VStack(spacing: 0) {
                    
                    // Header
                    headerView
                    
                    Divider()
                    
                    // Messages
                    msgView
                    
                    // Input Bar
                    inPutTextField
                }
                .background(Color(#colorLiteral(red: 0.9019607843, green: 0.9333333333, blue: 0.9803921569, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 50))
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.container, edges: .bottom)
    }
    
    private var backGroundImage: some View {
        Image("bacgroundImg")
            .resizable()
            .scaledToFill()
            .frame(height: 160)
            .clipped()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea()
    }
    
    private var headerView : some View {
        HStack(spacing: 12) {
            Image("profileImg")
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Benjamin Moore")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                Text("Last seen 11:44 AM")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Image("imgClose")
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 24)
        .padding(.bottom, 16)
    }
    
    private var msgView: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 12) {
                    Spacer().frame(height: 300)
                    ForEach(messages) { msg in
                        ChatBubbleView(message: msg)
                            .id(msg.id)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            }
            .onAppear {
                proxy.scrollTo(messages.last?.id, anchor: .bottom)
            }
        }
    }
    
    private var inPutTextField: some View {
        HStack(spacing: 12) {
            Button {
                print("Camera tapped")
            } label: {
                Image("imgChatCamera")
            }
            
            HStack {
                TextField("", text: $messageText)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                
                Button {
                    print("Send tapped")
                } label: {
                    Image("imsgSendChat")
                }
            }
            .background(Color.white)
            .clipShape(Capsule())
            .frame(height: 50)
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
        .padding(.bottom, 48)
    }
    
}

#Preview {
    MessageView()
}
