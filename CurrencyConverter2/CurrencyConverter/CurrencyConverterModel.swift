//
//  File.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 23/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation

struct CurrencyConverterModel: Decodable {
    let success: Bool
    let query: GetInfo
    let info: Info
    let date: String
    let result: Double
}

struct GetInfo: Decodable {
    let from: String
    let to: String
    let amount: Int
}

struct Info: Decodable {
    let rate: Double?
}


