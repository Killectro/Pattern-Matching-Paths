#!/usr/bin/env xcrun swift

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
guard let nString = readLine(), N = Int(nString) else {
    writeToStdErr("Invalid input format: The first line of the file must be a number")
    exit(EXIT_FAILURE)
}

var index = 0

while index < N {
    guard let pattern = readLine() else {
        writeToStdErr("Invalid input format: Reached EOF before expected")
        exit(EXIT_FAILURE)
    }
    
    print(pattern)
    index += 1
}

// Read paths from stdin and put into memory
guard let mString = readLine(), M = Int(mString) else {
    writeToStdErr("Invalid input format: The next line of the file must be a number")
    exit(EXIT_FAILURE)
}

index = 0
while index < M {
    guard let path = readLine() else {
        writeToStdErr("Invalid input format: Reached EOF before expected")
        exit(EXIT_FAILURE)
    }
    
    print(path)
    index += 1
}
