//
//  FruitDetailView.swift
//  Fructus
//
//  Created by skynet on 8/4/22.
//

import SwiftUI

struct FruitDetailView: View {
    // MARK: - PROPERTIES

    var fruit: Fruit

    // MARK: - BODY


    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    // HEADER

                    VStack(alignment: .leading, spacing: 20) {
                        // TITLE
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        // HEADLINE


                        // NUTRIENTS


                        // SUBHEADLINE


                        // LINK


                }//: VSTACK
                .padding(.horizontal, 20)
                .frame(maxWidth: 640, alignment: .center)
            }//: VStack
        }//: SCROLL
    }//: NAVIGATION
}
}

// MARK: - PREVIEW
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
            .previewDevice("iPhone 11 pro")
    }
}
