//
//  TabViewContent.swift
//  AheadTask
//
//  Created by Abdul Aleem on 07/03/26.
//

import SwiftUI

enum SelectedTab: Int, CaseIterable {
    case home, messages, notifications, profile, center
}

struct TabViewContent: View {

    let selectedTab: SelectedTab
    @Binding var path: NavigationPath

    var body: some View {
        switch selectedTab {
        case .home:          HomeView(path: $path)
        case .messages:      Text("Messages")
        case .notifications: Text("Notifications")
        case .profile:       Text("Profile")
        case .center:        Text("Center")
        }
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    TabViewContent(selectedTab: .home, path: $path)
}
