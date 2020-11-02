//
//  String+AddText.swift
//  MyLocations
//
//  Created by Khandaker Shayel on 10/24/20.
//  Copyright © 2020 Hunter CSCI Student. All rights reserved.
//

import Foundation

extension String {
    mutating func add(text: String?, separatedBy separator: String = "") {
        if let text = text {
            if !isEmpty {
                self += separator
            }
            self += text
        }
    }
    
}
