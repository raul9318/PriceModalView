//
//  PriceItem.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

struct PriceItem {
    let countCrowns: Int
    var priceForOneCrown: Double
    var bestPrice: Bool
    
    var priceForAllCrown: Double {
        return priceForOneCrown * Double(countCrowns)
    }
    
    var title: String {
        return compTitle()
    }
    
    init(countCrowns: Int, priceForOneCrown: Double = 0, bestPrice: Bool = false) {
        self.countCrowns = countCrowns
        self.priceForOneCrown = priceForOneCrown
        self.bestPrice = bestPrice
    }
    
    private func compTitle() -> String {
        var suffix = ""
        let mod = countCrowns & 10
        
        if mod == 1 || countCrowns == 1{
            suffix = "Корона"
        } else if mod == 2 || mod == 3 || mod == 4
            || countCrowns == 2 || countCrowns == 3 || countCrowns == 4
        {
            suffix = "Короны"
        } else {
            suffix = "Корон"
        }
        
        return "\(countCrowns) " + suffix
    }
}
