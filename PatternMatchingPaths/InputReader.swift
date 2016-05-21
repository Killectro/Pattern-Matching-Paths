//
//  InputReader.swift
//  
//
//  Created by DJ Mitchell on 5/20/16.
//
//

import Foundation

struct InputReader {
    /** Reads in the first line from standard in, which should be a number N, then reads the next N lines into an array of type T
     
    - Returns: An array of N items of type T
    */
    static func getItemsFromStandardInput<T: StringInitializable>() -> ([T]) {
        // Read the first line, which should be a number N that tells us how many more lines to read
        guard let nString = readLine(), N = Int(nString) else {
            ErrorOutput.writeToStdErr("Invalid input format: The first line of the file must be a number")
            exit(EXIT_FAILURE)
        }
        
        var objects = [T]()
        var index = 0
        
        // Read N lines from stdin and map them to type T
        while index < N {
            guard let line = readLine() else {
                ErrorOutput.writeToStdErr("Invalid input format: Reached EOF before expected")
                exit(EXIT_FAILURE)
            }
            
            objects.append(T(fromString: line))
            index += 1
        }
        
        return objects
    }
}