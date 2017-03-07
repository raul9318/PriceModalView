//
//  PriceCell.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class PriceCell: UITableViewCell {
    weak var crownImageView: UIImageView!
    weak var crownCountLabel: UILabel!
    weak var priceForOneLabel: UILabel!
    weak var titleLabel: UILabel!
    weak var priceForAllLabel: UILabel!
    weak var buyButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
