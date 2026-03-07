//
//  TabSection.swift
//  AheadTask
//
//  Created by Abdul Aleem on 06/03/26.
//

import SwiftUI

struct TabSection: View {
    
    @Binding var selectedTab: ProfileTab
    var body: some View {
        tabSection
    }
    
    var tabSection: some View {
        HStack(spacing: 0) {
            ForEach(ProfileTab.allCases, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 6) {
                        Text(tab.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedTab == tab ? .semibold : .regular)
                            .foregroundColor(selectedTab == tab ? .blue : .secondary)
                        
                        Capsule()
                            .fill(selectedTab == tab ? Color.blue : Color.clear)
                            .frame(height: 2)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .zIndex(10)
    }
}

#Preview {
    TabSection(selectedTab: .constant(.all))
}

enum ProfileTab: String, CaseIterable {
    case all = "All"
    case photos = "Photos"
    case videos = "Videos"
}
