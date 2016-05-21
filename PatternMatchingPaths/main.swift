#!/usr/bin/env

import Foundation

// MARK: - Script entry point

// Read patterns and paths from stdin and put into memory
let patterns: [Pattern] = InputReader.getItemsFromStandardInput()
let paths: [Path] = InputReader.getItemsFromStandardInput()

// Sort the patterns in descending order of "bestness" defined in problem requirements
// See description of >(_:_:) method for more info
let sortedPatterns = patterns.sort(>)

for path in paths {
    var output = "NO MATCH"
    for pattern in sortedPatterns {
        if pattern.matchesPath(path) {
            output = pattern.patternString
            break
        }
    }
    
    print("\(output)")
}
