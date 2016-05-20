//
//  InputReader.swift
//  
//
//  Created by DJ Mitchell on 5/20/16.
//
//

import Foundation

struct InputReader {
    static func getPatternsAndPathsFromStandardInput() -> ([Pattern], [Path]) {
        guard let nString = readLine(), N = Int(nString) else {
            writeToStdErr("Invalid input format: The first line of the file must be a number")
            exit(EXIT_FAILURE)
        }
        
        var patterns = [Pattern]()
        var index = 0
        
        while index < N {
            guard let pattern = readLine() else {
                writeToStdErr("Invalid input format: Reached EOF before expected")
                exit(EXIT_FAILURE)
            }
            
            patterns.append(Pattern(fromString: pattern))
            index += 1
        }
        
        // Read paths from stdin and put into memory
        guard let mString = readLine(), M = Int(mString) else {
            writeToStdErr("Invalid input format: The next line of the file must be a number")
            exit(EXIT_FAILURE)
        }
        
        var paths = [Path]()
        index = 0
        while index < M {
            guard let path = readLine() else {
                writeToStdErr("Invalid input format: Reached EOF before expected")
                exit(EXIT_FAILURE)
            }
            
            paths.append(Path(fromString: path))
            index += 1
        }
        
        patterns = patterns.sort(<)

        return (patterns, paths)
    }
}