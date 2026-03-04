//
//  HomeView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(
                title: "Explore",
                leadingImage: UIImage(named: "leadingCameraImg"),
                trailingImage: UIImage(named: "trailingNotificationImg"),
                onLeadingTap: { print("Menu tapped") },
                onTrailingTap: { print("Notifications tapped") }
            )
            .padding(.top, 50)
            StoriesRowView()
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

#Preview {
    HomeView()
}
