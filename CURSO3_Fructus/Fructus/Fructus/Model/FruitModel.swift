//
//  FruitModel.swift
//  Fructus
//
//  Created by skynet on 7/4/22.
//  https://swiftuimasterclass.com

import SwiftUI

// MARK: - FRUITS DATA MODEL

struct Fruit: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
