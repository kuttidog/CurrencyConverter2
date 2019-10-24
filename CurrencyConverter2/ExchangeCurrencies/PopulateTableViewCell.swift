//
//  PopulateTableViewCell.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 21/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import UIKit

class PopulateTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            populateCellData()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
//        var currencyLabel: UILabel = {
//            let name = UILabel()
//            name.translatesAutoresizingMaskIntoConstraints = false
//            return name
//        }()
    
        var rateLabel: UILabel = {
            let price = UILabel()
            price.translatesAutoresizingMaskIntoConstraints = false
            return price
        }()
        
        func populateCellData(){
//            addSubview(currencyLabel)
//            currencyLabel.snp.makeConstraints { (make) in
//                make.top.equalToSuperview().offset(10)
//                make.width.equalTo(130)
//                make.left.equalTo(20)
//            }
            
            addSubview(rateLabel)
            rateLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10)
         //       make.left.equalTo(currencyLabel.snp.right)
                make.centerX.equalToSuperview()
                make.width.equalTo(130)
            }
            
        }
}
