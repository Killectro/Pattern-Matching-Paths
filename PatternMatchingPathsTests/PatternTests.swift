//
//  PatternTests.swift
//  PatternMatchingPaths
//
//  Created by DJ Mitchell on 5/21/16.
//  Copyright © 2016 Killectro. All rights reserved.
//

import XCTest
@testable import PatternMatchingPaths

class PatternTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPatternInitializerCorrectlyPopulatesFields() {
        let pattern = Pattern(fromString: "hi,*,boop,*,wow")
        
        XCTAssert(pattern.numberOfComponents == 5)
        XCTAssert(pattern.components.count == 5)
        XCTAssert(pattern.components == ["hi","*","boop","*","wow"])
        XCTAssert(pattern.patternString == "hi,*,boop,*,wow")
        XCTAssert(pattern.numberOfWildcards == 2)
    }
}
