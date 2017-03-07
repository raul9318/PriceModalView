//
//  PriceManagerTests.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import XCTest
@testable import PriceModelView

class PriceManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_countOfItems_equalZero() {
        let sut = PriceManager()
        
        XCTAssertEqual(sut.itemsCount, 0)
    }
    
    func test_addItem_increaseItemsCount() {
        let sut = PriceManager()
        let priceItem = PriceItem(countCrowns: 3)
        sut.add(priceItem)
        
        XCTAssertEqual(sut.itemsCount, 1)
    }
    
}
