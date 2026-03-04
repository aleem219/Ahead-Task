//
//  UserProfileView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 03/03/26.
//

import SwiftUI

// MARK: - Main View
struct UserProfileView: View {
    
    // MARK: - onBoarding inputs
    @State private var followerList:String = "1K"
    @State private var followingList:String = "342"
    @State private var userName:String = "Catherine"
    @State private var selectedTab: ProfileTab = .all
    @State private var selectedAction: FollowActionState = .follow
    @State private var bio:String = "My name is Catherine. I like dancing in the rain and travelling all around the world."
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    headerSection
                    infoSection
                    photoGrid
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(30)
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
            }
            .ignoresSafeArea(edges: .top)
        }
        .navigationBarItems(
            leading: backButton,
            trailing: messageButton
        )
    }
}

// MARK: - Extracted Views
private extension UserProfileView {
    
    // MARK: - Header
    var headerSection: some View {
        ZStack(alignment: .bottom) {
            Image("bacgroundImg")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, minHeight: 250)
                .clipped()
                .ignoresSafeArea(edges: .top)
            profileAvatar
                .offset(y: 40)
        }
        .padding(.bottom, 40)
    }
    
    // MARK: - Profile Image
    var profileAvatar: some View {
        Image("profileImg")
            .resizable()
            .scaledToFill()
            .frame(width: 90, height: 90)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 4)
    }
    
    // MARK: - Stats
    var statsRow: some View {
        HStack(spacing: 60) {
            StatItemView(value: followerList, label: "Followers")
            StatItemView(value: followingList, label: "Following")
        }
        .padding(.horizontal,16)
    }
    
    // MARK: - Info Section
    var infoSection: some View {
        VStack(spacing: 12) {
            statsRow
            
            Text(userName)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(bio)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
            actionButtons
                .frame(maxWidth: .infinity)
            
            tabSection
            
        }
        .padding(.horizontal,40)
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Photo Grid
    var photoGrid: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Image("profileImg")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(12)
                
                VStack(spacing: 8) {
                    Image("profileImg")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 96)
                        .clipped()
                        .cornerRadius(12)
                    
                    Image("profileImg")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 96)
                        .clipped()
                        .cornerRadius(12)
                }
                .frame(maxWidth: .infinity)
            }
            
            HStack(spacing: 8) {
                ForEach(Array(["profileImg", "profileImg", "profileImg"].enumerated()), id: \.offset) { _, name in
                    Image(name)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .clipped()
                        .cornerRadius(12)
                }
            }
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.bottom, 16)
    }
    
    // MARK: - Action Buttons
    var actionButtons: some View {
        HStack(spacing: 16) {
            
            FollowActionButton(
                action: .follow,
                selectedAction: selectedAction
            ) {
                selectedAction = .follow
            }
            
            FollowActionButton(
                action: .message,
                selectedAction: selectedAction
            ) {
                selectedAction = .message
            }
        }
        .padding(.horizontal, 16)
    }
    // MARK: - Tab Bar
    var tabSection: some View {
        HStack(spacing: 32) {
            ForEach(ProfileTab.allCases, id: \.self) { tab in
                TabItemView(tab: tab, isSelected: selectedTab == tab) {
                    selectedTab = tab
                }
            }
        }
        .padding(.vertical, 12)
    }
    
    // MARK: - Nav Buttons
    var backButton: some View {
        Button { } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.primary)
                .padding(8)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
        }
    }
    
    // MARK: - Message Button
    var messageButton: some View {
        Button { } label: {
            Image(systemName: "envelope")
                .foregroundColor(.primary)
                .padding(8)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
        }
    }
}

// MARK: - Supporting Views
struct StatItemView: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

// MARK: - Tab Item View
struct TabItemView: View {
    let tab: ProfileTab
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 6) {
                Text(tab.title)
                    .font(.subheadline)
                    .fontWeight(isSelected ? .semibold : .regular)
                    .foregroundColor(isSelected ? .blue : .secondary)
                
                Capsule()
                    .fill(isSelected ? Color.blue : Color.clear)
                    .frame(height: 2)
            }
        }
    }
}

// MARK: - Tab Enum
enum ProfileTab: CaseIterable {
    case all, photos, videos
    
    var title: String {
        switch self {
        case .all:    return "All"
        case .photos: return "Photos"
        case .videos: return "Videos"
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        UserProfileView()
    }
}
