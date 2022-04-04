//
//  CircleGroupView.swift
//  Restart
//
//  Created by admin on 4/4/22.
//

import SwiftUI

struct CircleGroupView: View {

    // MARK: - PROPERTY

    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false

    // MARK: - BODY

    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
            .blur(radius: isAnimating ? 0 : 2)
            .opacity(isAnimating ? 1 : 0)
            .scaleEffect(isAnimating ? 1 : 0.7)
            .animation(.easeOut(duration: 1.5), value: isAnimating)
            .onAppear(perform: {
            isAnimating = true
        })
    }
}

//MARK: - PREVIEW

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)

            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.5)
        }
    }
}
