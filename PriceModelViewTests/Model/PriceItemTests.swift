//
//  PriceItemTests.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import XCTest
@testable import PriceModelView

class PriceItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_priceForAllCrown() {
        let priceItem = PriceItem(countCrowns: 2, priceForOneCrown: 159, bestPrice: false)

        XCTAssertEqual(priceItem.priceForAllCrown, 318)
        
    }
    
    func test_title_forOneCrown() {
        let priceItem = PriceItem(countCrowns: 1)
        
        XCTAssertEqual(priceItem.title, "1 Корона")
    }
    
    func test_title_forThreeCrowns() {
        let priceItem = PriceItem(countCrowns: 3)
        
        XCTAssertEqual(priceItem.title, "3 Короны")
    }
    
    func test_title_forFiveCrowns() {
        let priceItem = PriceItem(countCrowns: 5)
        XCTAssertEqual(priceItem.title, "5 Корон")
    }
    
}
