//
//  LogoAnimationApp.swift
//  LogoAnimation
//
//  Created by Kunal Kumar on 2021-02-25.
//

import SwiftUI

@main
struct LogoAnimationApp: App {
    @ObservedObject private var color = BrandColor()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(color)
        }
    }
}
