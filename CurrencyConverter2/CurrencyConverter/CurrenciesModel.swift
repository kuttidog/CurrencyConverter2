//
//  File.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 23/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation



struct CurrenciesModel: Decodable {
    let success: Bool
    let rates: [String: Double]?
    let error: ErrorInfo?
    
}

struct ErrorInfo: Decodable {
    let code: Int
    let type: String
    let info: String?
}
