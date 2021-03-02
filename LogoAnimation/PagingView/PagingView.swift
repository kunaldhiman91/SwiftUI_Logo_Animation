//
//  PagingView.swift
//  LogoAnimation
//
//  Created by Kunal Kumar on 2021-02-28.
//

import SwiftUI

struct PagingView<Content: View>: View {
    @GestureState private var translation: CGFloat = 0
    let pageCount: Int
    let interPageSpacing: CGFloat
    let adjacentPageVisibleWidth: CGFloat
    @Binding var currentIndex: Int
    let content: Content
    
    init(pageCount: Int,interPageSpacing: CGFloat, adjacentPageVisibleWidth: CGFloat, currentIndex: Binding<Int>, content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.interPageSpacing = interPageSpacing
        self.adjacentPageVisibleWidth = adjacentPageVisibleWidth
        self.content = content()
    }
    
    var spacingAroundCard: CGFloat {
        2 * (adjacentPageVisibleWidth + interPageSpacing)
    }
    
    var body: some View {
        GeometryReader { reader in
            let pageWidth: CGFloat = reader.size.width - (2 * (adjacentPageVisibleWidth + 2 * interPageSpacing))
            
            HStack(spacing: 0) {
                self.content
                    .frame(width: pageWidth)
                    .padding([.leading, .trailing], self.interPageSpacing)
                    .opacity(translation.isZero ? 1.0 : 0.8)
            }.padding(.leading, adjacentPageVisibleWidth +  interPageSpacing)
            .frame(width: reader.size.width, alignment: .leading)
            .offset(x: self.translation)
            .offset(x: -CGFloat(currentIndex
                                    * Int(reader.size.width - spacingAroundCard)))
            .animation(.interactiveSpring(), value: currentIndex)
            .animation(.interactiveSpring(), value: translation)
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / reader.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                }
            )
        }
    }
}

struct PagingView_Previews: PreviewProvider {
    
    @State static var currentPage: Int = 0
    
    static var previews: some View {
        PagingView(pageCount: 10,
                  interPageSpacing: 16.0,
                  adjacentPageVisibleWidth: 32.0,
                  currentIndex: $currentPage) {
            ForEach (0...10, id: \.self) { item in
                RoundedRectangle(cornerRadius: 64.0)
                    .foregroundColor(Color.red)
            }
        }
    }
}
