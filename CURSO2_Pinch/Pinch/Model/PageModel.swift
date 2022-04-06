//
//  PageModel.swift
//  Pinch
//
//  Created by skynet on 6/4/22.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
