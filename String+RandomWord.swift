//
//  String+RandomWord.swift
//  MyLocations
//
//  Created by Khandaker Shayel on 10/23/20.
//  Copyright © 2020 Hunter CSCI Student. All rights reserved.
//

import Foundation

extension String {
  func addRandomWord() -> String {
    let words = ["rabbit", "banana", "boat"]
    let value = Int.random(in: 0 ..< words.count)
    let word = words[value]
    return self + word
} }
