//
//  MessageView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

import SwiftUI

struct MessageView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var messageText: String = ""
    
    @StateObject private var viewModel = ChatMessageViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            
            backGroundImage
            VStack(spacing: 0) {
                Color.clear.frame(height: 64)
                
                VStack(spacing: 0) {
                    
                    headerView
                    
                    Divider()
                    
                    msgView
                    
                    inPutTextField
                }
                .background(Color(#colorLiteral(red: 0.9019607843, green: 0.9333333333, blue: 0.9803921569, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .padding(.bottom,30)
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.container, edges: .bottom)
        .onAppear {
            viewModel.getUsers()
        }
    }
    
    // MARK: - Background
    
    private var backGroundImage: some View {
        Image("bacgroundImg")
            .resizable()
            .clipped()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea()
    }
    
    // MARK: - Header
    
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
    
    // MARK: - Messages
    
    private var msgView: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 12) {
                    ForEach(viewModel.chats) { msg in
                        ChatBubbleView(message: msg)
                            .id(msg.id)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            }
            .onChange(of: viewModel.chats.count) { oldValue, newValue in
                if let last = viewModel.chats.last {
                    withAnimation {
                        proxy.scrollTo(last.id, anchor: .bottom)
                    }
                }
            }
        }
    }
    
    // MARK: - Input
    
    private var inPutTextField: some View {
        HStack(spacing: 12) {
            
            Button {
                print("Camera tapped")
            } label: {
                Image("imgChatCamera")
            }
            
            HStack {
                
                TextField("Message...", text: $messageText)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                
                Button {
                    sendMessage()
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
    
    // MARK: - Send Message
    
    private func sendMessage() {
        guard !messageText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        let newMessage = ChatMessageModel(text: messageText, isMe: true)
        viewModel.chats.append(newMessage)
        
        messageText = ""
    }
}

#Preview {
    MessageView()
}
