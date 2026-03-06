//
//  ActionButton.swift
//  AheadTask
//
//  Created by Abdul Aleem on 06/03/26.
//

import SwiftUI

struct ActionButton: View {
    
    @Binding var selectedAction: FollowActionState
    @Binding var navigateToMessage: Bool
    
    var body: some View {
        actionButtons
    }
    
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
    }
}

#Preview {
    ActionButton(
        selectedAction: .constant(.follow),
        navigateToMessage: .constant(false)
    )
}
