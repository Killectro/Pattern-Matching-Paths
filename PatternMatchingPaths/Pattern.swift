//
//  Pattern.swift
//  
//
//  Created by DJ Mitchell on 5/19/16.
//
//

import Foundation

struct Pattern {
    // MARK: - Properties
    static let SEPARATOR = ","
    static let WILDCARD = "*"
    
    let patternString: String
    let components: [String]
    let numberOfWildcards: Int
    var numberOfComponents: Int {
        return components.count
    }
    
    // MARK: - Initializers
    init(fromString string: String) {
        patternString = string
        components = string.componentsSeparatedByString(Pattern.SEPARATOR)
        numberOfWildcards = components.filter{$0 == Pattern.WILDCARD}.count
    }
}

// MARK: - Matching
extension Pattern {
    func matchesPath(path: Path) -> Bool {
        guard path.numberOfComponents == self.numberOfComponents else { return false }
        
        for (patternComponent, pathComponent) in zip(self.components, path.components) {            
            if patternComponent != Pattern.WILDCARD && patternComponent != pathComponent {
                return false
            }
        }
        
        return true
    }
}

// MARK: - Sorting
/** Custom sort operator that sorts patterns by descending order of "bestness" (i.e. the best Pattern is first)
    This is accomplished in two ways:
    1. If one has less wildcards than the other, it is automatically better
    2. Otherwise if they are equal, the Pattern whose left-most `Pattern.WILDCARD` is farthest to the right is better
 */
func > (lhs: Pattern, rhs: Pattern) -> Bool {
    if lhs.numberOfWildcards == rhs.numberOfWildcards {
        
        // Iterate through each component, up through the length of the shorter pattern
        for (leftComponent, rightComponent) in zip(lhs.components, rhs.components) {
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
        
        // If it gets here, the patterns are either exactly the same or different lengths
        // which means we don't particularly care which order they go in
        return true
    } else {
        return lhs.numberOfWildcards < rhs.numberOfWildcards
    }
}
