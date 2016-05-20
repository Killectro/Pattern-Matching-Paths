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

// Custom sort operator for Patterns
func < (lhs: Pattern, rhs: Pattern) -> Bool {
    if lhs.numberOfWildcards == rhs.numberOfWildcards {
        
        for (index, leftComponent) in lhs.components.enumerate() {
            let rightComponent = rhs.components[index]
            
            if leftComponent == Pattern.WILDCARD && rightComponent == Pattern.WILDCARD {
                // They are the both wildcards, keep searching
                continue
            } else if leftComponent == Pattern.WILDCARD {
                // Left has a wildcard but right doesn't, right should go first
                return false
            } else if rightComponent == Pattern.WILDCARD {
                // Right has a wildcard but left doesn't, left should go first
                return true
            }
        }
        
        // This will only exectute if two patterns are exactly the same
        return true
    } else {
        return lhs.numberOfWildcards < rhs.numberOfWildcards
    }
}
