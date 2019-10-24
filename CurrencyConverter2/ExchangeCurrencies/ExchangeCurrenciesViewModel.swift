//
//  File.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 24/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import UIKit

//protocol CurrencyConverterViewable {
//    func currencyCon(fromCurrency: String, toCurrency: String, amount: String, completion: @escaping (CurrencyConverterModel?, ServiceError?) -> ())
//    
//}

protocol ExchangeCurrenciesViewable {
    
    func exchangeCurrencies(fromCurrency: String, toCurrencies: String, completion: @escaping (_ report: [String : Double]?, ServiceError?) -> ())
}

class ExchangeCurrenciesViewModel: ExchangeCurrenciesViewable {
    
    let service: ExchangeCurrenciesServiceable
    
    init(service: ExchangeCurrenciesServiceable) {
        self.service = service
    }
    
    convenience init() {
        
        self.init(service: ExchangeCurrenciesService())
    }

    func exchangeCurrencies(fromCurrency: String, toCurrencies: String, completion: @escaping ([String : Double]?, ServiceError?) -> ()) {
        service.exchangeCurrencies(fromCurrency: fromCurrency, toCurrencies: toCurrencies, completion: completion)
        
    }
}
