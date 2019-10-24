//
//  CurrencyConverterViewModel.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 23/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import UIKit

protocol CurrencyConverterViewable {
    func currencyCon(fromCurrency: String, toCurrency: String, amount: String, completion: @escaping (CurrencyConverterModel?, ServiceError?) -> ())
    
}

class CurrencyConverterViewModel: CurrencyConverterViewable {
    
    let service: CurrencyConverterServiceable
    init(service: CurrencyConverterServiceable) {
        self.service = service
    }
    
    convenience init() {
        
        self.init(service: CurrencyConvertService())
    }
//
    func currencyCon(fromCurrency: String, toCurrency: String, amount: String, completion: @escaping (CurrencyConverterModel?, ServiceError?) -> ()) {
        service.convertCurrencyAPI(fromCurrency: fromCurrency, toCurrency: toCurrency, amount: amount, completion: completion)
    }
    
    }

