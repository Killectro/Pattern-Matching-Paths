//
//  ErrorOutput.swift
//  
//
//  Created by DJ Mitchell on 5/20/16.
//
//

import Foundation

struct ErrorOutput {
    static func writeToStdErr(str: String) {
        let handle = NSFileHandle.fileHandleWithStandardError()
        
        if let data = str.dataUsingEncoding(NSUTF8StringEncoding) {
            handle.writeData(data)
        }
    }
}