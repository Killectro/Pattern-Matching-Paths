//
//  PathTests.swift
//  PatternMatchingPaths
//
//  Created by DJ Mitchell on 5/21/16.
//  Copyright © 2016 Killectro. All rights reserved.
//

import XCTest
@testable import PatternMatchingPaths

class PathTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPathInitializerCorrectlyPopulatesFields() {
        let path = Path(fromString: "/w/a/b/z")
        
        XCTAssert(path.components.count == 4)
        XCTAssert(path.components == ["w","a","b","z"])
        XCTAssert(path.pathString == "w/a/b/z")
    }

}
