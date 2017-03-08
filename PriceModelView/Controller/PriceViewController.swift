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
    
    let modalShowAnimationTransitioningDelegate = ModalShowAnimationTransitioningDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        priceManager = PriceManager()
        
        // For test
        priceManager.add(PriceItem(countCrowns: 1, priceForOneCrown: 159, bestPrice: false))
        priceManager.add(PriceItem(countCrowns: 3, priceForOneCrown: 129, bestPrice: false))
        priceManager.add(PriceItem(countCrowns: 5, priceForOneCrown: 99, bestPrice: true))
        
        priceDataPrivider = PriceDataProvider()
        priceDataPrivider.priceManager = priceManager

        tableView.dataSource = priceDataPrivider
        tableView.delegate = priceDataPrivider
        
        transitioningDelegate = modalShowAnimationTransitioningDelegate
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
