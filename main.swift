#!/usr/bin/env

import Foundation

// MARK: - Script entry point

// Read patterns from stdin and put into memory
let (patterns, paths) = InputReader.getPatternsAndPathsFromStandardInput()
let sortedPatterns = patterns.sort(<)

print(sortedPatterns.map{$0.components})