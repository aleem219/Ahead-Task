//
//  CurvedTabBarShape.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI
//
struct CurvedTabBarShape: Shape {
    
    var circleRadius: CGFloat = 35
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let centerX = rect.width / 2
        let notchRadius = circleRadius
        
        // Start from top-left
        path.move(to: CGPoint(x: 0, y: 0))
        
        // Left side
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        
        // Move to right of notch
        path.addLine(to: CGPoint(x: centerX + notchRadius + 10, y: 0))
        
        // Notch
        path.addArc(
            center: CGPoint(x: centerX, y: 0),
            radius: notchRadius + 10,
            startAngle: .degrees(0),
            endAngle: .degrees(180),
            clockwise: false
        )
        
        path.closeSubpath()
        
        return path
    }
}


