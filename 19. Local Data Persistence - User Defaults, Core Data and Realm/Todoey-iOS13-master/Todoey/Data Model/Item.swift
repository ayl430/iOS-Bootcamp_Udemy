//
//  Item.swift
//  Todoey
//
//  Created by yeri on 2022/04/07.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

// Encodable -> Item type은 plist나 JSON으로 encode 할 수 있다.
// Encodable은 모든 프로퍼티가 standard data type이어야 한다.
// Encodable, Decodable을 Codable 하나로
class Item: Codable {
    var title: String = ""
    var done: Bool = false
}
