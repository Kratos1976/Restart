//
//  StartButtonView.swift
//  Fructus
//
//  Created by skynet on 7/4/22.
//  https://swiftuimasterclass.com

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES

    @AppStorage("isOnboardingView") var isOnboardingView: Bool?

    // MARK: - BODY


    var body: some View {
        Button(action: {
           isOnboardingView = false
        }) {
            HStack(spacing: 8) {
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical,10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
        }//: BUTTON
        .accentColor(Color.white)
    }
}
// MARK: - PREVIEW
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
