//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by David Chiu on 5/31/19.
//  Copyright © 2019 David Chiu. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMealInitializationSucceeds() {
        //Zero rating
        let zeroResult = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroResult)
        
        let positiveResults = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveResults)
    }
    
    func testMealInitializationFails() {
        let negativeRatingMeal = Meal.init(name: "NegativeRating", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        let emptyName = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyName)
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
    }
}
