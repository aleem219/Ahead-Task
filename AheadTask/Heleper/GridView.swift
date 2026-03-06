//
//  GridView.swift
//  AheadTask
//
//  Created by Abdul Aleem on 06/03/26.
//

import SwiftUI

struct GridView: View {
    
    @ObservedObject var viewModel: UserProfileDetailViewModel
    
    var body: some View {
        photoGrid
    }
    
    // MARK: - Photo Grid
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
}

#Preview {
    GridView(viewModel: UserProfileDetailViewModel())
}
