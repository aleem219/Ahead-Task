//
//  StoriesRowView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

import SwiftUI

struct StoriesRowView: View {
    
    let users: [StoryUser] = [
        StoryUser(name: "You", image: "profileImg", isYou: true),
          StoryUser(name: "Benjamin", image: "profileImg", isYou: false),
          StoryUser(name: "Farita", image: "profileImg", isYou: false),
          StoryUser(name: "Marie", image: "profileImg", isYou: false),
          StoryUser(name: "Chris", image: "profileImg", isYou: false),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(users) { user in
                    StoryItemView(user: user)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    StoriesRowView()
}
