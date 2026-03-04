//
//  StoriesRowView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI



struct StoriesRowView: View {
    
    let stories: [StoryUser]
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(stories) { user in
                    StoryItemView(user: user)
                        .onTapGesture {
                            path.append(user)
                        }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
}


#Preview {
    PreviewWrapper()
}

struct PreviewWrapper: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        StoriesRowView(
            stories: StoryUser.getMockData(),
            path: $path
        )
    }
}
