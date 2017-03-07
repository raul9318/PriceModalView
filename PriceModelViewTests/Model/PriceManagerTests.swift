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
    var sut: PriceManager!
    
    override func setUp() {
        super.setUp()
        sut = PriceManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_countOfItems_equalZero() {
        XCTAssertEqual(sut.itemsCount, 0)
    }
    
    func test_addItem_increaseItemsCount() {
        let priceItem = PriceItem(countCrowns: 3)
        sut.add(priceItem)
        
        XCTAssertEqual(sut.itemsCount, 1)
    }
    
    func test_itemFor_retursItem() {
        let priceItem = PriceItem(countCrowns: 3)
        sut.add(priceItem)
        
        XCTAssertEqual(priceItem, sut.itemFor(index: 0))
    }
    
}
