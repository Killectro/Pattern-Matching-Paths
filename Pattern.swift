//
//  Pattern.swift
//  
//
//  Created by DJ Mitchell on 5/19/16.
//
//

import Foundation

struct Pattern {
    static let SEPARATOR = ","
    static let WILDCARD = "*"
    
    let patternString: String
    let components: [String]
    let numberOfWildcards: Int
    
    init(fromString string: String) {
        patternString = string
        components = string.componentsSeparatedByString(Pattern.SEPARATOR)
        numberOfWildcards = components.filter{$0 == Pattern.WILDCARD}.count
    }
}
