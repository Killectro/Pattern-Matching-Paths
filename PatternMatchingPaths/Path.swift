//
//  Path.swift
//
//
//  Created by DJ Mitchell on 5/19/16.
//
//

import Foundation

struct Path: StringInitializable {
    static let SEPARATOR = "/"
    
    let pathString: String
    let components: [String]
    var numberOfComponents: Int {
        return components.count
    }

    // MARK: - Initializers
    init(fromString string: String) {
        pathString = string.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: Path.SEPARATOR))
        components = pathString.componentsSeparatedByString(Path.SEPARATOR)
    }
}

