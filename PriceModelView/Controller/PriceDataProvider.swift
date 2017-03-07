//
//  PriceDataProvider.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation
import UIKit

class PriceDataProvider: NSObject, UITableViewDataSource {
    var priceManager: PriceManager!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return priceManager.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "priceCell", for: indexPath) as! PriceCell
        
        //let priceItem = priceManager.itemFor(index: indexPath.row)
        //cell.configCell(with: priceItem)
        
        return cell
    }
}

extension PriceDataProvider: UITableViewDelegate {
    
}
