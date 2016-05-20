#!/usr/bin/env

import Foundation

// MARK: - Helper functions
func writeToStdErr(str: String) {
    let handle = NSFileHandle.fileHandleWithStandardError()
    
    if let data = str.dataUsingEncoding(NSUTF8StringEncoding) {
        handle.writeData(data)
    }
}

// MARK: - Script entry point

// Read patterns from stdin and put into memory
let (patterns, paths) = InputReader.getPatternsAndPathsFromStandardInput()

print(patterns.map{$0.components})