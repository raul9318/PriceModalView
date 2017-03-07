//
//  PriceViewController.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class PriceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var priceDataPrivider: PriceDataProvider!
    
    var priceManager: PriceManager! {
        didSet {
            self.priceDataPrivider?.priceManager = priceManager
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        priceManager = PriceManager()
        
        priceDataPrivider = PriceDataProvider()
        priceDataPrivider.priceManager = priceManager

        tableView.dataSource = priceDataPrivider
        tableView.delegate = priceDataPrivider
    }

}
