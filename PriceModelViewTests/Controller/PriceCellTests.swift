//
//  PriceCellTests.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import XCTest
@testable import PriceModelView

class PriceCellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_hasAllLabels() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PriceViewController") as! PriceViewController
        
        _ = vc.view
        
        let tableView: UITableView = vc.tableView
        
        let priceManager = PriceManager()
        priceManager.add(PriceItem(countCrowns: 1))
        
        vc.priceManager = priceManager
        
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! PriceCell
        
        
        XCTAssertNotNil(cell.crownImageView)
        XCTAssertNotNil(cell.crownCountLabel)
        XCTAssertNotNil(cell.priceForOneLabel)
        XCTAssertNotNil(cell.titleLabel)
        XCTAssertNotNil(cell.priceForAllLabel)
        XCTAssertNotNil(cell.buyButton)
    }
    
    
}
