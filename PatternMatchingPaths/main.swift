#!/usr/bin/env

import Foundation

// MARK: - Script entry point

// Read patterns from stdin and put into memory
let (patterns, paths) = InputReader.getPatternsAndPathsFromStandardInput()
// Sort the patterns in order of "bestness" defined in problem requirements

let sortedPatterns = patterns.sort(<)

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
