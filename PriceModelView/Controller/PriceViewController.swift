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
    @IBOutlet weak var headerMainSpinnerView: MainSpinnerView!
    @IBOutlet weak var headerCircleSubView: UIView!
    
    @IBOutlet var priceDataPrivider: PriceDataProvider!
    
    @IBOutlet weak var headerCrown1: UIImageView!
    @IBOutlet weak var headerCrown2: UIImageView!
    @IBOutlet weak var headerCrown3: UIImageView!
    @IBOutlet weak var headerCrown4: UIImageView!
    @IBOutlet weak var headerCrown5: UIImageView!
    
    @IBOutlet weak var headerCrown6: UIImageView!
    @IBOutlet weak var headerCrown7: UIImageView!
    @IBOutlet weak var headerCrown8: UIImageView!
    @IBOutlet weak var headerCrown9: UIImageView!
    @IBOutlet weak var headerCrown10: UIImageView!
    
    
    var priceManager: PriceManager! {
        didSet {
            self.priceDataPrivider?.priceManager = priceManager
        }
    }
    
    let modalShowAnimationTransitioningDelegate = ModalShowAnimationTransitioningDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        priceManager = PriceManager()
        
        
        priceManager.add(PriceItem(countCrowns: 1, priceForOneCrown: 159, bestPrice: false))
        priceManager.add(PriceItem(countCrowns: 3, priceForOneCrown: 129, bestPrice: false))
        priceManager.add(PriceItem(countCrowns: 5, priceForOneCrown: 99, bestPrice: true))
        
        priceDataPrivider = PriceDataProvider()
        priceDataPrivider.priceManager = priceManager

        tableView.dataSource = priceDataPrivider
        tableView.delegate = priceDataPrivider
        
        transitioningDelegate = modalShowAnimationTransitioningDelegate
        
        rotateHeaderCrowns()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        headerMainSpinnerView.addSpinner(withDuration: 1)
    }
    
    override func viewWillLayoutSubviews() {
        setupCirclesViews()
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupCirclesViews() {
        headerMainSpinnerView.layer.cornerRadius = headerMainSpinnerView.frame.height / 2
        headerMainSpinnerView.layer.masksToBounds = true
        
        headerCircleSubView.layer.cornerRadius = headerCircleSubView.frame.height / 2
        headerCircleSubView.layer.masksToBounds = true
    }
    
    private func rotateHeaderCrowns() {
        let base = M_PI / 180
        
        headerCrown1.transform = CGAffineTransform(rotationAngle: CGFloat(-45 * base))
        headerCrown2.transform = CGAffineTransform(rotationAngle: CGFloat(-21 * base))
        headerCrown3.transform = CGAffineTransform(rotationAngle: CGFloat(263 * base))
        headerCrown4.transform = CGAffineTransform(rotationAngle: CGFloat(-87 * base))
        headerCrown5.transform = CGAffineTransform(rotationAngle: CGFloat(240 * base))
        
        headerCrown6.transform = CGAffineTransform(rotationAngle: CGFloat(45 * base))
        headerCrown7.transform = CGAffineTransform(rotationAngle: CGFloat(34 * base))
        headerCrown8.transform = CGAffineTransform(rotationAngle: CGFloat(87 * base))
        headerCrown9.transform = CGAffineTransform(rotationAngle: CGFloat((135-21) * base))
        headerCrown10.transform = CGAffineTransform(rotationAngle: CGFloat((90 - 122) * base))
    }
}
