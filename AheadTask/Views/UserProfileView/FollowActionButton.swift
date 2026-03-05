//
//  FollowActionButton.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

// FollowActionButton.swift

import SwiftUI

enum FollowActionState {
    case follow
    case message
    
    var title: String {
        switch self {
        case .follow: return "Follow"
        case .message: return "Message"
        }
    }
}

struct FollowActionButton: View {
    
    let action: FollowActionState
    let selectedAction: FollowActionState
    let onTap: () -> Void
    
    private var isSelected: Bool {
        selectedAction == action
    }
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                onTap()
            }
        } label: {
            Text(action.title)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .foregroundColor(isSelected ? .white : .primary)
                .background(
                    Capsule()
                        .fill(isSelected
                              ? Color(red: 0.42, green: 0.60, blue: 0.86)
                              : Color.white)
                        .shadow(
                            color: isSelected
                                ? Color(red: 0.42, green: 0.60, blue: 0.86).opacity(0.45)
                                : Color.black.opacity(0.08),
                            radius: isSelected ? 12 : 4,
                            x: 0,
                            y: isSelected ? 6 : 2
                        )
                )
        }
        .buttonStyle(.plain)
    }
}

struct FollowMessageButtonGroup: View {
    @State private var selected: FollowActionState = .follow

    var body: some View {
        HStack(spacing: 12) {
            FollowActionButton(action: .follow, selectedAction: selected) {
                selected = .follow
            }
            FollowActionButton(action: .message, selectedAction: selected) {
                selected = .message
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(red: 0.90, green: 0.93, blue: 0.97))
        )
        .padding()
    }
}

#Preview {
    FollowMessageButtonGroup()
}

#Preview {
    FollowActionButton(
        action: .follow,
        selectedAction: .message,
        onTap: { }
    )
    .padding()
}
