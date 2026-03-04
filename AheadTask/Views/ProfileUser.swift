//
//  ProfileUser.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//


import SwiftUI

// MARK: - Data Model

struct ProfileUser {
    let username: String
    let bio: String
    let followers: Int
    let following: Int
    let avatarName: String
}

// MARK: - Sample Data

let sampleUser = ProfileUser(
    username: "@Catherine13",
    bio: "My name is Catherine. I like dancing in the rain and travelling all around the world.",
    followers: 1000,
    following: 342,
    avatarName: "person.crop.circle.fill"
)

let sampleImages: [String] = [
    "photo1", "photo2", "photo3",
    "photo4", "photo5", "photo6"
]

// MARK: - Main Profile View

struct ProfileView: View {
    @State private var isFollowing = false
    @State private var selectedTab: ProfileTab2 = .all

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    PhoneFrame {
                        VStack(spacing: 0) {
                            // Banner + Avatar
                            BannerSection()

                            // Stats + Info
                            ProfileInfoSection(
                                user: sampleUser,
                                isFollowing: $isFollowing
                            )

                            // Tab Toggle
                            TabToggleSection(selectedTab: $selectedTab)

                            // Grid
                            PhotoGridSection()
                                .padding(.bottom, 28)
                        }
                        .background(Color(red: 0.94, green: 0.96, blue: 1.0))
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

// MARK: - Phone Frame Wrapper

struct PhoneFrame<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 44, style: .continuous))
            .shadow(color: Color(red: 0.4, green: 0.47, blue: 0.78).opacity(0.22), radius: 40, x: 0, y: 20)
//            .padding(.horizontal, 16)
    }
}

// MARK: - Banner Section

struct BannerSection: View {
    var body: some View {
        ZStack(alignment: .top) {
            // Banner gradient (simulating marble/fluid art)
            Image("bacgroundImg")
                .resizable()
                .frame(height: 300)
            // Nav buttons
            HStack {
                NavCircleButton(icon: "chevron.left")
                Spacer()
                NavCircleButton(icon: "envelope.fill")
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
    }
}

struct NavCircleButton: View {
    let icon: String

    var body: some View {
        Button(action: {}) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.4))
                .frame(width: 36, height: 36)
                .background(Color.white.opacity(0.88))
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 2)
        }
    }
}

// MARK: - Profile Info Section

struct ProfileInfoSection: View {
    let user: ProfileUser
    @Binding var isFollowing: Bool

    var body: some View {
        VStack(spacing: 0) {
            // Avatar overlapping banner
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 94, height: 94)
                    .shadow(color: Color(red: 0.5, green: 0.6, blue: 0.9).opacity(0.25), radius: 12, x: 0, y: 4)

                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 84, height: 84)
                    .clipShape(Circle())
                    .foregroundColor(Color(red: 0.6, green: 0.5, blue: 0.75))
            }
            .offset(y: -47)
            .padding(.bottom, -47)

            // Stats row
            HStack(spacing: 0) {
                StatView(value: formatCount(user.followers), label: "Followers")
                Spacer()
                StatView(value: "\(user.following)", label: "Following")
            }
            .padding(.horizontal, 32)
//            .padding(.top, 60)

            // Username
            Text(user.username)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.25))
                .padding(.top, 10)

            // Bio
            Text(user.bio)
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.55))
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding(.horizontal, 28)
                .padding(.top, 6)

            // Action Buttons
            HStack(spacing: 14) {
                Button(action: { isFollowing.toggle() }) {
                    Text(isFollowing ? "Following" : "Follow")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.42, green: 0.65, blue: 0.97),
                                    Color(red: 0.55, green: 0.48, blue: 0.95)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(Capsule())
                        .shadow(color: Color(red: 0.42, green: 0.65, blue: 0.97).opacity(0.4), radius: 10, x: 0, y: 4)
                }

                Button(action: {}) {
                    Text("Message")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.38))
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color(red: 0.88, green: 0.90, blue: 0.96), lineWidth: 1.5)
                        )
                        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 18)
            .padding(.bottom, 20)
        }
        .background(Color(red: 0.94, green: 0.96, blue: 1.0))
    }

    func formatCount(_ n: Int) -> String {
        n >= 1000 ? "\(n / 1000)k" : "\(n)"
    }
}

struct StatView: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.25))
            Text(label)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Color(red: 0.55, green: 0.58, blue: 0.68))
        }
    }
}

// MARK: - Tab Toggle Section

enum ProfileTab2: String, CaseIterable {
    case all = "All"
    case photos = "Photos"
    case videos = "Videos"
}

struct TabToggleSection: View {
    @Binding var selectedTab: ProfileTab2

    var body: some View {
        HStack(spacing: 0) {
            ForEach(ProfileTab2.allCases, id: \.self) { tab in
                Button(action: { selectedTab = tab }) {
                    VStack(spacing: 6) {
                        Text(tab.rawValue)
                            .font(.system(size: 14, weight: selectedTab == tab ? .semibold : .regular))
                            .foregroundColor(
                                selectedTab == tab
                                    ? Color(red: 0.42, green: 0.65, blue: 0.97)
                                    : Color(red: 0.55, green: 0.58, blue: 0.68)
                            )

                        // Underline indicator
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

// MARK: - Photo Grid Section

struct PhotoGridSection: View {
    // Simulate 6 photos with system images + colors
    let gridItems = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6)
    ]

    let photos: [(color: Color, icon: String, tall: Bool)] = [
        (Color(red: 0.18, green: 0.52, blue: 0.78), "figure.open.water.swim", true),
        (Color(red: 0.35, green: 0.45, blue: 0.60), "building.columns.fill", false),
        (Color(red: 0.40, green: 0.62, blue: 0.45), "mountain.2.fill", false),
        (Color(red: 0.22, green: 0.22, blue: 0.35), "figure.stand", false),
        (Color(red: 0.82, green: 0.42, blue: 0.68), "wind", false),
        (Color(red: 0.88, green: 0.55, blue: 0.25), "tree.fill", false),
    ]

    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 6) {
            ForEach(Array(photos.enumerated()), id: \.offset) { index, photo in
                PhotoCell(color: photo.color, icon: photo.icon)
                    .frame(height: index == 0 ? 230 : 110)
                    // First photo spans 2 rows visually via height
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 14)
    }
}

struct PhotoCell: View {
    let color: Color
    let icon: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(color)

            // Gradient overlay for depth
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [Color.black.opacity(0.0), Color.black.opacity(0.25)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            Image(systemName: icon)
                .font(.system(size: 28, weight: .light))
                .foregroundColor(Color.white.opacity(0.6))
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

// MARK: - Preview

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
