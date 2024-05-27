//
//  Item.swift
//  Tobianw
//
//  Created by Holger Krupp on 26.05.24.
//

import Foundation
import SwiftData

@Model
final class Song {
    var timestamp: Date
    var titel: String = ""
    var lyrics: String = ""
    
    var locate: String = Locale.current.description
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
