//
//  Item.swift
//  Tobianw
//
//  Created by Holger Krupp on 26.05.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
