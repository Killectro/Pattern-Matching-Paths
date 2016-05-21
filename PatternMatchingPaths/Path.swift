//
//  Path.swift
//
//
//  Created by DJ Mitchell on 5/19/16.
//
//

import Foundation

struct Path {
    static let SEPARATOR = "/"
    
    let pathString: String
    let components: [String]
    
    init(fromString string: String) {
        pathString = string.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: Path.SEPARATOR))
        components = pathString.componentsSeparatedByString(Path.SEPARATOR)
    }
}

