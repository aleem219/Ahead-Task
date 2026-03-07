//
//  StoryItemView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct StoryItemView: View {
    let user: StoryUser
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [Color.blue.opacity(0.8), Color.blue.opacity(0.5)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 3
                    )
                    .frame(width: 74, height: 74)
                
                Image(user.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 66, height: 66)
                    .clipShape(Circle())
                
                if user.isYou {
                    ZStack {
                        Circle()
                            .fill(Color.black.opacity(0.25))
                            .frame(width: 66, height: 66)
                        
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }
            
            Text(user.name)
                .font(.system(size: 13))
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    StoryItemView(user: StoryUser(name: "You", image: "person.fill", isYou: true))
}
