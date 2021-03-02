//
//  ShapeClipModifier.swift
//  LogoAnimation
//
//  Created by Kunal Kumar on 2021-02-27.
//

import SwiftUI

struct ShapeClipModifier: ViewModifier {
    let amount: Double
    
    func body(content: Content) -> some View {
        content
            .rotation3DEffect(.degrees(amount), axis: (x: 0, y: 1, z: 0)).clipped()
    }
}
