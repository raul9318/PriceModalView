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
    
    var item: PriceItem?
    
    var priceForOneLabelDefaulFont: UIFont!
    var priceForAllLabelDefaulFont: UIFont!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        priceForOneLabelDefaulFont = priceForOneLabel.font!
        priceForAllLabelDefaulFont = priceForAllLabel.font!
    }
    
    func configCell() {
        guard let item = item else {
            return
        }
        
        var priceForOneString = "\(item.priceForOneCrown)\(rubleCharacter) / шт"
        if item.bestPrice {
            priceForOneString += "\r\n" + "лучшая цена"
        }
        
        priceForOneLabel.attributedText = priceForOneAttributedString(priceForOneString)
        
        crownCountLabel.text = String(item.countCrowns)
        titleLabel.text = item.title
        priceForAllLabel.attributedText =  priceForAllAttributedString("\(item.priceForAllCrown)\(rubleCharacter)")
        
        if item.bestPrice {
            setupBestPriceLabel()
        } else {
            setupDefaultPriceLabel()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let item = item else {
            return
        }
        

    }
    
    private func setupDefaultPriceLabel() {
        priceForOneLabel.backgroundColor = UIColor.clear
        priceForOneLabel.textColor = UIColor(colorLiteralRed: 47/255, green: 149/255, blue: 1.0, alpha: 1.0)
        priceForOneLabel.frame = CGRect(origin: priceForOneLabel.frame.origin, size: CGSize(width: priceForOneLabel.frame.width, height: 22.0))
        priceForOneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        priceForOneLabel.layer.cornerRadius = 0
        priceForOneLabel.layer.masksToBounds = false
    }
    
    private func setupBestPriceLabel() {
        priceForOneLabel.backgroundColor = bestBackgroundColor
        
        priceForOneLabel.textAlignment = .center
        priceForOneLabel.textColor = UIColor.white
        
        let newRect = CGRect(origin: priceForOneLabel.frame.origin, size: CGSize(width: priceForOneLabel.frame.width, height: 40.0))
        
        
        priceForOneLabel.frame = newRect
        priceForOneLabel.translatesAutoresizingMaskIntoConstraints = true
        
        priceForOneLabel.layer.cornerRadius = priceForOneLabel.frame.height / 2
        priceForOneLabel.layer.masksToBounds = true
    }
    
    private func priceForOneAttributedString(_ str: String) -> NSMutableAttributedString {
        
        let returnedAttributedString = NSMutableAttributedString(string: str, attributes: [NSFontAttributeName: UIFont(name: ".SFUIText-Semibold", size: priceForOneLabelDefaulFont.pointSize) ?? UIFont.boldSystemFont(ofSize: priceForOneLabelDefaulFont.pointSize)])
        
        returnedAttributedString.addAttribute(NSFontAttributeName, value: UIFont(name: ".SFUIText-Semibold", size: priceForOneLabelDefaulFont.pointSize + 5) ?? UIFont.boldSystemFont(ofSize: priceForOneLabelDefaulFont.pointSize + 5), range: NSRange.init(location: 0, length: String(item!.priceForOneCrown).characters.count))
        
        if item!.bestPrice {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.8
            paragraphStyle.alignment = .center
            
            returnedAttributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange.init(location: 0, length: returnedAttributedString.length))
        }
        
        return returnedAttributedString
    }
    
    private func priceForAllAttributedString(_ str: String) -> NSMutableAttributedString {
        let returnedAttributedString = NSMutableAttributedString(string: str, attributes: [NSFontAttributeName: UIFont(name: ".SFUIText", size: priceForAllLabelDefaulFont.pointSize + 4) ?? UIFont.systemFont(ofSize: priceForAllLabelDefaulFont.pointSize + 4)])
        
        returnedAttributedString.addAttribute(NSFontAttributeName, value: UIFont(name: ".SFUIText", size: priceForAllLabelDefaulFont.pointSize) ?? UIFont.systemFont(ofSize: priceForAllLabelDefaulFont.pointSize), range: NSRange.init(location: returnedAttributedString.length - 1, length: 1))
        
        return returnedAttributedString
    }

}
