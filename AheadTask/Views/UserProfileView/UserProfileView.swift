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
    @State private var navigateToMessage = false
    @State private var selectedTab: ProfileTab = .all
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedAction: FollowActionState = .follow
    @StateObject private var viewModel = UserProfileDetailViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    headerSection
                    infoSection
                    tabSection
                    photoGrid
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(30)
                .padding(.bottom, 16)
            }
            .ignoresSafeArea(edges: .top)
        }
        .onAppear {
            viewModel.getUserrDetail()
        }
        .navigationDestination(isPresented: $navigateToMessage) {
            MessageView()
        }
        .onChange(of: navigateToMessage) {
            if !navigateToMessage {
                selectedAction = .follow
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CommonToolbarButton(icon: .asset("arrowBack")) {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                CommonToolbarButton(icon: .asset("trailingMsgIcon")) {
                    print("Back")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func dismiss () {
        presentationMode.wrappedValue.dismiss()
    }
}

// MARK: - Extracted Views
private extension UserProfileView {
    
    // MARK - Header
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
    
    // MARK - Profile Image
    var profileAvatar: some View {
        Image(viewModel.userDetail.first?.profileAvatar ?? "0")
            .resizable()
            .scaledToFill()
            .frame(width: 90, height: 90)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 4)
    }
    
    // MARK - Stats
    var statsRow: some View {
        HStack(spacing: 60) {
            StatItemView(value: viewModel.userDetail.first?.followerList ?? "0", label: "Followers")
            StatItemView(value: viewModel.userDetail.first?.followingList ?? "0", label: "Following")
        }
        .padding(.horizontal,16)
    }
    
    // MARK - Info Section
    var infoSection: some View {
        VStack(spacing: 12) {
            statsRow
            
            Text(viewModel.userDetail.first?.userName ?? "")
                .font(.title3)
                .fontWeight(.bold)
            
            Text(viewModel.userDetail.first?.bio ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
            actionButtons
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 40)
        .frame(maxWidth: .infinity)
    }
    
    // MARK - Photo Grid
    var photoGrid: some View {
        
        let photos = viewModel.userDetail.first?.photos ?? []
        
        let availableWidth = UIScreen.main.bounds.width - 20 * 2 - 8
        let leftWidth  = availableWidth * 0.55
        let rightWidth = availableWidth * 0.45
        
        let smallHeight: CGFloat = 96
        let smallSpacing: CGFloat = 4
        
        let bigHeight = smallHeight * 2 + smallSpacing
        
        let bottomColumns = Array(
            repeating: GridItem(.flexible(), spacing: smallSpacing),
            count: 3
        )
        
        let chunks = stride(from: 0, to: photos.count, by: 6).map {
            Array(photos[$0..<min($0 + 6, photos.count)])
        }
        
        return VStack(spacing: smallSpacing) {
            
            ForEach(Array(chunks.enumerated()), id: \.offset) { _, chunk in
                
                let topImages = Array(chunk.prefix(3))
                let bottomImages = Array(chunk.dropFirst(3).prefix(3))
                
                // MARK: Top Section
                HStack(alignment: .top, spacing: smallSpacing) {
                    
                    if let first = topImages.first {
                        Image(first)
                            .resizable()
                            .scaledToFill()
                            .frame(width: leftWidth, height: bigHeight)
                            .clipped()
                            .cornerRadius(12)
                    }
                    
                    VStack(spacing: smallSpacing) {
                        
                        ForEach(Array(topImages.dropFirst().enumerated()), id: \.offset) { _, name in
                            Image(name)
                                .resizable()
                                .scaledToFill()
                                .frame(width: rightWidth, height: smallHeight)
                                .clipped()
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                
                // MARK: Bottom Grid
                if !bottomImages.isEmpty {
                    
                    LazyVGrid(columns: bottomColumns, spacing: smallSpacing) {
                        
                        ForEach(Array(bottomImages.enumerated()), id: \.offset) { _, name in
                            Image(name)
                                .resizable()
                                .scaledToFill()
                                .frame(height: smallHeight)
                                .clipped()
                                .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 20)
    }
    
    // MARK - Action Buttons
    var actionButtons: some View {
        HStack(spacing: 16) {
            FollowActionButton(action: .follow, selectedAction: selectedAction) {
                selectedAction = .follow
            }
            
            FollowActionButton(action: .message, selectedAction: selectedAction) {
                selectedAction = .message
                navigateToMessage = true
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 50)
        .allowsHitTesting(true)
    }
    // MARK - Tab Bar
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

// MARK - Supporting Views
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

// MARK - Tab Item View
struct TabItemView: View {
    let tab: ProfileTab
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 6) {
                Text(tab.rawValue)
                    .font(.subheadline)
                    .fontWeight(isSelected ? .semibold : .regular)
                    .foregroundColor(isSelected ? .blue : .secondary)
                
                Capsule()
                    .fill(isSelected ? Color.blue : Color.clear)
                    .frame(height: 2)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}

// MARK - Tab Enum
enum ProfileTab: String, CaseIterable {
    case all = "All"
    case photos = "Photos"
    case videos = "Videos"
}

struct TabToggleSection: View {
    @Binding var selectedTab: ProfileTab
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(ProfileTab.allCases, id: \.self) { tab in
                Button(action: { selectedTab = tab }) {
                    VStack(spacing: 6) {
                        Text(tab.rawValue)
                            .font(.system(size: 14, weight: selectedTab == tab ? .semibold : .regular))
                            .foregroundColor(
                                selectedTab == tab
                                ? Color(red: 0.42, green: 0.65, blue: 0.97)
                                : Color(red: 0.55, green: 0.58, blue: 0.68)
                            )
                        
                        Rectangle()
                            .fill(
                                selectedTab == tab
                                ? Color(red: 0.42, green: 0.65, blue: 0.97)
                                : Color.clear
                            )
                            .frame(height: 2)
                            .clipShape(Capsule())
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                }
            }
        }
        .padding(.horizontal, 24)
        .background(Color(red: 0.94, green: 0.96, blue: 1.0))
        .overlay(
            Rectangle()
                .fill(Color(red: 0.88, green: 0.91, blue: 0.96))
                .frame(height: 1),
            alignment: .bottom
        )
    }
}

// MARK: - Preview
#Preview {
    UserProfileView()
}
