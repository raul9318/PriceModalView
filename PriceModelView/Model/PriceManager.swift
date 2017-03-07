//
//  PriceManager.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation

class PriceManager {
    var itemsCount: Int {
        return items.count
    }
    private var items: [PriceItem] = []
    
    func add(_ item: PriceItem) {
        items.append(item)
    }
}
