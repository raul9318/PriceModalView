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
    
    @IBOutlet weak var titleLabelTopConstraint: NSLayoutConstraint!
    
    
    private let rubleCharacter: Character = "₽"
    private let bestBackgroundColor = UIColor(red: 47/255, green: 149/255, blue: 1.0, alpha: 1.0)
    
    var item: PriceItem?
    
    var priceForOneLabelDefaulFontPointSize: CGFloat!
    var priceForAllLabelDefaulFontPointSize: CGFloat!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        priceForOneLabelDefaulFontPointSize = priceForOneLabel.font!.pointSize * FontScale.getScaleValue()
        priceForAllLabelDefaulFontPointSize = priceForAllLabel.font!.pointSize * FontScale.getScaleValue()
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
    }

    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let item = item else {
            return
        }
        
        if item.bestPrice {
            setupBestPriceLabel()
        } else {
            setupDefaultPriceLabel()
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
        
        let returnedAttributedString = NSMutableAttributedString(string: str, attributes: [NSFontAttributeName: UIFont(name: ".SFUIText-Semibold", size: priceForOneLabelDefaulFontPointSize) ?? UIFont.boldSystemFont(ofSize: priceForOneLabelDefaulFontPointSize)])
        
        returnedAttributedString.addAttribute(NSFontAttributeName, value: UIFont(name: ".SFUIText-Semibold", size: priceForOneLabelDefaulFontPointSize + 5 * FontScale.getScaleValue()) ?? UIFont.boldSystemFont(ofSize: priceForOneLabelDefaulFontPointSize + 5 * FontScale.getScaleValue()), range: NSRange.init(location: 0, length: String(item!.priceForOneCrown).characters.count))
        
        if item!.bestPrice {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.8
            paragraphStyle.alignment = .center
            
            returnedAttributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange.init(location: 0, length: returnedAttributedString.length))
        }
        
        return returnedAttributedString
    }
    
    private func priceForAllAttributedString(_ str: String) -> NSMutableAttributedString {
        let returnedAttributedString = NSMutableAttributedString(string: str, attributes: [NSFontAttributeName: UIFont(name: ".SFUIText", size: priceForAllLabelDefaulFontPointSize + 4 * FontScale.getScaleValue()) ?? UIFont.systemFont(ofSize: priceForAllLabelDefaulFontPointSize + 4 * FontScale.getScaleValue())])
        
        returnedAttributedString.addAttribute(NSFontAttributeName, value: UIFont(name: ".SFUIText", size: priceForAllLabelDefaulFontPointSize) ?? UIFont.systemFont(ofSize: priceForAllLabelDefaulFontPointSize), range: NSRange.init(location: returnedAttributedString.length - 1, length: 1))
        
        return returnedAttributedString
    }

}
