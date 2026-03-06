//
//  CurvedTabBarShape.swift
//  AheadTask
//
//  Created by Abdul Aleem on 04/03/26.
//

import SwiftUI

struct CurvedTabBarShape: Shape {
    
    var circleRadius: CGFloat = 35
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let centerX = rect.width / 2
        let depth: CGFloat = 50
        
        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addLine(to: CGPoint(x: centerX - 70, y: 0))
        
        path.addCurve(
            to: CGPoint(x: centerX, y: depth),
            control1: CGPoint(x: centerX - 40, y: 0),
            control2: CGPoint(x: centerX - 40, y: depth)
        )
        
        path.addCurve(
            to: CGPoint(x: centerX + 70, y: 0),
            control1: CGPoint(x: centerX + 40, y: depth),
            control2: CGPoint(x: centerX + 40, y: 0)
        )
        
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
    
        path.closeSubpath()
        
        return path
    }
}
