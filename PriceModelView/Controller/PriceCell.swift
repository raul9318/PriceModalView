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
    
    private var item: PriceItem!
    
    func configCell(with item: PriceItem) {
        self.item = item
        
        var priceForOneString = "\(item.priceForOneCrown)\(rubleCharacter) / шт"
        if item.bestPrice {
            priceForOneString += "\r\n" + "лучшая цена"
        }
        
        priceForOneLabel.attributedText = priceForOneAttributedString(priceForOneString)
        crownCountLabel.text = String(item.countCrowns)
        titleLabel.text = item.title
        priceForAllLabel.text = "\(item.priceForAllCrown)\(rubleCharacter)"
    }
    
    func setupBestPrice() {
        priceForOneLabel.backgroundColor = bestBackgroundColor
        
        priceForOneLabel.textAlignment = .center
        priceForOneLabel.textColor = UIColor.white
        
        let newRect = CGRect(origin: priceForOneLabel.frame.origin, size: CGSize(width: priceForOneLabel.frame.width, height: priceForOneLabel.frame.height + 15))
        
        
        priceForOneLabel.frame = newRect
        priceForOneLabel.translatesAutoresizingMaskIntoConstraints = true
        
        priceForOneLabel.layer.cornerRadius = priceForOneLabel.frame.height / 2
        priceForOneLabel.layer.masksToBounds = true
    }
    
    private func priceForOneAttributedString(_ priceForOneString: String) -> NSMutableAttributedString {
        let priceForOneAttributedString = NSMutableAttributedString(string: priceForOneString, attributes: [NSFontAttributeName: UIFont(name: ".SFUIText-Semibold", size: 13.0)])
        
        priceForOneAttributedString.addAttribute(NSFontAttributeName, value: UIFont(name: ".SFUIText-Semibold", size: 18.0), range: NSRange.init(location: 0, length: String(item.priceForOneCrown).characters.count))
        
        if item.bestPrice {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.8
            
            priceForOneAttributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange.init(location: 0, length: priceForOneAttributedString.length))
        }
        
        return priceForOneAttributedString
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
