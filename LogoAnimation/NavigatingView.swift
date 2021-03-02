//
//  NavigatingView.swift
//  LogoAnimation
//
//  Created by Kunal Kumar on 2021-02-27.
//

import SwiftUI

struct NavigatingView: View {
    @Namespace private var shapeTransition
    @State var expand: Bool = false
    @State private var currentPage: Int = 0
    let data = (1...10)
    @State var selectedCard: Int = 0
    let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { gr in
            VStack(alignment: .center) {
                if expand {
                    PagingView(pageCount: 10, interPageSpacing: 8.0, adjacentPageVisibleWidth: 32.0, currentIndex: $currentPage, content: {
                        ForEach(data, id: \.self) { item in
                            CreditCard(item: Int(item)).onTapGesture {
                                selectedCard = item
                                withAnimation {
                                    expand.toggle()
                                }
                            }.id(item)
                            .foregroundColor(Color.red)
                        }
                    }).frame(height: 200)
                    Spacer()
                }
                
                else {
                    Spacer()
                    HStack {
                        Spacer()
                        CreditCard(item: selectedCard)
                            .foregroundColor(Color.blue)
                            .animation(.default)
                            .transition(.slide)
                            .frame(width: 180,
                                   height: 120)
                            .onTapGesture {
                                withAnimation {
                                    expand.toggle()
                                }
                            }
                        Spacer()
                    }
                }
            }
        }.background(Color.secondary)
    }
}

struct NavigatingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatingView()
            .preferredColorScheme(.dark)
    }
}


struct CreditCard: View {
    
    let item: Int
    
    var body: some View {
        ZStack {
            Image(systemName: "creditcard.fill")
                .resizable()
                .overlay( Text("**** **** **** 000\(item)")
                            .fontWeight(.heavy)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center), alignment: .center)
                .overlay(Text("John Doe")
                            .fontWeight(.heavy)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center), alignment: .bottom)
                .overlay(BrandShape(percentage: 1).frame(width: 20, height: 20, alignment: .center).foregroundColor(.secondary).padding(.top, 5), alignment: .top)
        }
    }
}



