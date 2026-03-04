//
//  HeaderView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String?
    
    
    var showLeading: Bool = true
    var showTitle: Bool = true
    var showTrailing: Bool = true
    
   
    var leadingImage: UIImage? = nil
    var trailingImage: UIImage? = nil
    
  
    var onLeadingTap: (() -> Void)? = nil
    var onTrailingTap: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            
            if showLeading, let leadingImage = leadingImage {
                Image(uiImage: leadingImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .padding(.leading, 4)
                    .onTapGesture {
                        onLeadingTap?()
                    }
            }
            
            Spacer()
            
            if showTitle, let title = title {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            if showTrailing, let trailingImage = trailingImage {
                Image(uiImage: trailingImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .padding(.trailing, 4)
                    .onTapGesture {
                        onTrailingTap?()
                    }
            }
        }
        .padding(.horizontal)
        .frame(height: 50)
//        .overlay(
//            Rectangle()
//                .fill(Color.gray.opacity(0.25))
//                .frame(height: 1),
//            alignment: .bottom
//        )
    }
}
#Preview {
    HeaderView(title: "Abdul Aleem")
}
