//
//  TabbarView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct TabbarView: View {
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        ZStack(alignment: .top) {
            CurvedTabBarShape()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(#colorLiteral(red: 0.5568627451, green: 0.6196078431, blue: 0.7843137255, alpha: 1)).opacity(0.85),
                            Color(#colorLiteral(red: 0.4274509804, green: 0.5176470588, blue: 0.7137254902, alpha: 1)).opacity(0.9),
                            Color(#colorLiteral(red: 0.3411764706, green: 0.4392156863, blue: 0.6823529412, alpha: 1)).opacity(0.95)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 85)
                .shadow(radius: 10)
            
            HStack {
                tabItem(icon: "house.fill", index: 0)
                Spacer()
                tabItem(icon: "bubble.left.fill", index: 1)
                Spacer().frame(width: 110)
                tabItem(icon: "person.fill", index: 2)
                Spacer()
                tabItem(icon: "bell.fill", index: 3)
            }
            .padding(.horizontal, 30)
            .frame(height: 85)
            
            Button {
                print("Center tapped")
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 70, height: 70)
                        .shadow(radius: 6)
                    
                    Image(systemName: "plus")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.blue)
                }
            }
            .offset(y: -40)
        }
    }
    
    func tabItem(icon: String, index: Int) -> some View {
        Button {
            selectedIndex = index
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundColor(selectedIndex == index ? .white : .white.opacity(0.6))
                
                // Underline indicator
                Rectangle()
                    .fill(selectedIndex == index ? Color.white : Color.clear)
                    .frame(width: 20, height: 2)
                    .cornerRadius(1)
            }
        }
    }
}


#Preview {
    ZStack {
        Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).ignoresSafeArea()
        VStack {
            Spacer()
            TabbarView(selectedIndex: .constant(0))
        }
    }
}
