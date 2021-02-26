//
//  ContentView.swift
//  LogoAnimation
//
//  Created by Kunal Kumar on 2021-02-25.
//

import SwiftUI

// TODO: Change color of white logo after every turn
class BrandColor: ObservableObject {
    
    private let colorArray: [Color] = [.red, .green, .yellow, .pink]
    @Published var colorCount = 0
    
    func nextColor() {
        colorCount += 1
    }
    
    func color() -> Color {
        return colorArray[colorCount]
    }
}

struct ContentView: View {
    @EnvironmentObject var brandColor: BrandColor
    @State var endAmount: CGFloat = 0
    @State var rotateX: Double = 0
    @State var finished = false
    
    let shapeBounds = UIBezierPath.generateBoundsFromPaths(paths: [.path4])
    
    var body: some View {
        Color.red
            .overlay(
                ZStack {
                    BrandShapeView(path: .path4, pathBounds: shapeBounds)
                        .trim(from: 0.0, to: endAmount)
                        .stroke(Color.white, lineWidth: 8.0)
                    
                    BrandShapeView(path: .path4, pathBounds: shapeBounds)
                        .trim(from: 0.0, to: endAmount)
                        .fill(Color.white).opacity(finished ? 1 : 0)
                    
                }
                .frame(width: 263,
                       height: 296)
                .scaleEffect(x: 0.2, y: 0.2, anchor: .center)
                .rotation3DEffect(.degrees(rotateX), axis: (x: 0, y: 0, z: 1))
                .onAppear {
                    withAnimation(Animation.easeOut(duration: 1.0).delay(1.0)) {
                        endAmount = 1.0
                    }
                    withAnimation(Animation.easeOut(duration: 1.0).delay(2.0)) {
                        finished = !finished
                    }
                    withAnimation(Animation.easeInOut(duration: 1.0).delay(2.0).repeatForever(autoreverses: false)) {
                        rotateX = 180
                    }
                }
            ).ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark).environmentObject(BrandColor())
            
    }
}
