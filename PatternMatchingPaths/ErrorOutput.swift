//
//  ErrorOutput.swift
//  
//
//  Created by DJ Mitchell on 5/20/16.
//
//

import Foundation

struct ErrorOutput {
    /// Appends a newline and writes content out to stderr
    static func writeToStdErr(str: String) {
        let withNewline = str + "\n"
        
        let handle = NSFileHandle.fileHandleWithStandardError()
        
        if let data = withNewline.dataUsingEncoding(NSUTF8StringEncoding) {
            handle.writeData(data)
        }
    }
}