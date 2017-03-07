//
//  PriceBuyButton.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class PriceBuyButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 2.5
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 30/255, green: 140/255, blue: 1.0, alpha: 1.0).cgColor
    }
    


}
