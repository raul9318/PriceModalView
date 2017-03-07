//
//  PriceCell.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class PriceCell: UITableViewCell {
    @IBOutlet weak var crownImageView: UIImageView!
    @IBOutlet weak var crownCountLabel: UILabel!
    @IBOutlet weak var priceForOneLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceForAllLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    private let rubleCharacter: Character = "₽"
    private let bestBackgroundColor = UIColor(red: 47/255, green: 149/255, blue: 1.0, alpha: 1.0)
    
    private var item: PriceItem?
    
    func configCell(with item: PriceItem) {
        var priceForOneString = "\(item.priceForOneCrown)\(rubleCharacter) / шт"
        if item.bestPrice {
            priceForOneString += "\r\n" + "лучшая цена"
        }
        
        let priceForOneAttributedString = NSMutableAttributedString(string: priceForOneString, attributes: [NSFontAttributeName: UIFont(name: ".SFUIText-Semibold", size: 13.0)])
        
        priceForOneAttributedString.addAttribute(NSFontAttributeName, value: UIFont(name: ".SFUIText-Semibold", size: 18.0), range: NSRange.init(location: 0, length: String(item.priceForOneCrown).characters.count))
        
        
        priceForOneLabel.attributedText = priceForOneAttributedString //"\(item.priceForOneCrown)\(rubleCharacter) / шт"
        crownCountLabel.text = String(item.countCrowns)
        titleLabel.text = item.title
        priceForAllLabel.text = "\(item.priceForAllCrown)\(rubleCharacter)"
        
        self.item = item
    }
    
    func setupBestPrice() {
        priceForOneLabel.backgroundColor = bestBackgroundColor
        
        priceForOneLabel.textAlignment = .center
        priceForOneLabel.textColor = UIColor.white
        
        let newRect = priceForOneLabel.frame//priceForOneLabel.frame.insetBy(dx: 13, dy: 10)
        
        priceForOneLabel.drawText(in: newRect)
        
        priceForOneLabel.layer.cornerRadius = newRect.height / 2
        priceForOneLabel.layer.masksToBounds = true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let item = item else {
            return
        }
        if item.bestPrice {
            setupBestPrice()
        }
    }

}
