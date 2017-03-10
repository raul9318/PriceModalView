//
//  ScaleInterfaceHelper.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 10.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import Foundation
import UIKit

struct FontScale {
    static func getScaleValue() -> CGFloat {
        switch UIScreen.main.bounds.size.height {
        case 568:
            return 0.8
        case 667:
            return 1
        case 736:
            return 1
        default:
            return 1
        }
    }
}

struct BestCellRowHeight {
    static func plusPT() -> CGFloat {
        switch UIScreen.main.bounds.size.height {
        case 568:
            return 5
        case 667:
            return 10
        case 736:
            return 15
        default:
            return 0
        }
    }
}

struct ModalView {
    static func topMargin() -> CGFloat {
        switch UIScreen.main.bounds.size.height {
        case 568:
            return 76
        case 667:
            return 76
        case 736:
            return 76
        default:
            return 76
        }
    }
}

