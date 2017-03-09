//
//  CircleView.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 08.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class CircleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }

}
