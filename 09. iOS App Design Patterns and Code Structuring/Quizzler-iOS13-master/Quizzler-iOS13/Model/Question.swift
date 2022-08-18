//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by yeri on 2022/06/11.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
