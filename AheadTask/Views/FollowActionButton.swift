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
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .foregroundColor(isSelected ? .white : .primary)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isSelected ? Color.blue : Color.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            isSelected ? Color.blue : Color.gray,
                            lineWidth: isSelected ? 0 : 1
                        )
                )
        }
    }
}

#Preview {
    FollowActionButton(
        action: .follow,
        selectedAction: .message,
        onTap: { }
    )
    .padding()
}
