//
//  CommonToolbarButton.swift
//  AheadTask
//
//  Created by Abdul Aleem on 06/03/26.
//

import SwiftUI

enum ToolbarIcon {
    case system(String)
    case asset(String)
}

struct CommonToolbarButton: View {
    
    var icon: ToolbarIcon
    var tint: Color = .primary
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            iconView
        }
        .tint(tint)
    }
    
    @ViewBuilder
    private var iconView: some View {
        switch icon {
        case .system(let name):
            Image(systemName: name)
            
        case .asset(let name):
            Image(name)
        }
    }
}

#Preview {
    CommonToolbarButton(icon: .system("flame.fill"), action: {})
}
