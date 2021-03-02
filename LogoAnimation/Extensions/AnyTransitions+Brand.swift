//
//  Transitions+Brand.swift
//  LogoAnimation
//
//  Created by Kunal Kumar on 2021-02-27.
//

import SwiftUI

extension AnyTransition {
    static var brandTransition: AnyTransition {
        asymmetric(insertion: .slide, removal: AnyTransition.modifier(
                    active: ShapeClipModifier(amount: -90),
                    identity: ShapeClipModifier(amount: 0))).combined(with: .scale(scale: 2.0))
    }
}
