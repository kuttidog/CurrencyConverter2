//
//  TestTableViewCell.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 21/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
