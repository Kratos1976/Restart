//
//  ContentView.swift
//  Fructus
//
//  Created by skynet on 7/4/22.
//  https://swiftuimasterclass.com

import SwiftUI

struct ContentView: View {

    // MARK: - PROPERTIES

    @State private var isShowingSettings: Bool = false
    @State private var isOnboarding: Bool = false


    var fruits: [Fruit] = fruitsData

    // MARK: - BODY

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                        .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                }
            }
                .navigationTitle("Fruits")
                .navigationBarItems(
                trailing:
                    Button(action: {
                    isShowingSettings = true
                }) {
                    Image(systemName: "slider.horizontal.3")
                } //: BUTTON
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
            )
                .navigationBarItems(
                leading:
                    Button(action: {
                    isOnboarding = true
                }) {
                    Image(systemName: "arrow.left")
                } //: BUTTON
                    .sheet(isPresented: $isOnboarding) {
                        OnboardingView()
                    }
            )
        }//: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
            .previewDevice("iPhone 11 Pro")
    }
}
