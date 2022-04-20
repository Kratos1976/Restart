//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by skynet on 20/4/22.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTIES

    var labelText: String
    var labelImage: String

    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            Text("Fructus".uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}
// MARK: - PREVIEW

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
