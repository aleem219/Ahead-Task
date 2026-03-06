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
                    TabSection(selectedTab: $selectedTab)
                    GridView(viewModel: viewModel)
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
            
            ActionButton(
                selectedAction: $selectedAction,
                navigateToMessage: $navigateToMessage
            )
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 40)
        .frame(maxWidth: .infinity)
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
                                ? Color(#colorLiteral(red: 0.4196078431, green: 0.6509803922, blue: 0.968627451, alpha: 1))
                                : Color(#colorLiteral(red: 0.5490196078, green: 0.5803921569, blue: 0.6784313725, alpha: 1))
                            )
                        
                        Rectangle()
                            .fill(
                                selectedTab == tab
                                ? Color(#colorLiteral(red: 0.4196078431, green: 0.6509803922, blue: 0.968627451, alpha: 1))
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
        .background(Color(#colorLiteral(red: 0.9411764706, green: 0.9607843137, blue: 1, alpha: 1)))
        .overlay(
            Rectangle()
                .fill(Color(#colorLiteral(red: 0.8784313725, green: 0.9098039216, blue: 0.9607843137, alpha: 1)))
                .frame(height: 1),
            alignment: .bottom
        )
    }
}

// MARK: - Preview
#Preview {
    UserProfileView()
}
