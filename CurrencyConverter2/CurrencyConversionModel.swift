//
//  CurrencyConverterModel.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 19/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
//
//  CurrencyConversionModel.swift
//  CurrencyConverter
//
//  Created by Kulanthaivel, Myl (.) on 18/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

protocol CurrencyConverterService {
    
    func currencyCon(fromCurrency: String, toCurrency: String, amount: String, completion: @escaping (CurrencyConverterModel) -> ())
    func exchangeCurrencies(fromCurrency: String, toCurrencies: String, completion: @escaping (_ report: CurrenciesModel?, ErrorModel?) -> ())
    
}

class CurrencyConversionModel: CurrencyConverterService {
  
    

    
    private let headers = ["x-rapidapi-host" : "fixer-fixer-currency-v1.p.rapidapi.com", "x-rapidapi-key" : "fdd1a62164mshaa7d08ea69d24bdp117f0ejsn84495048cb87"]
    
    private let baseUrl = "https://fixer-fixer-currency-v1.p.rapidapi.com/"
   
    func currencyCon(fromCurrency: String, toCurrency: String, amount: String, completion: @escaping (CurrencyConverterModel) -> ()) {
        let url = "https://fixer-fixer-currency-v1.p.rapidapi.com/convert?from=\(fromCurrency)&to=\(toCurrency)&amount=\(amount)"
        let urlRequester = URL(string: url)!
        var request = URLRequest(url: urlRequester)
        request.httpMethod = "GET"
        request.addValue("fdd1a62164mshaa7d08ea69d24bdp117f0ejsn84495048cb87",forHTTPHeaderField: "x-rapidapi-key")
        request.addValue("fixer-fixer-currency-v1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        URLSession.shared.dataTask(with: request) {(data,response,error) in
            guard let data = data else {
                print("Fatal Error", terminator: "")
                return
            }
            
            do{
                let result = try JSONDecoder().decode(CurrencyConverterModel.self, from: data)
                print(result)
                completion(result)
            }
            catch {
                print("error")
            } }.resume()
    }
    
    func exchangeCurrencies(fromCurrency: String, toCurrencies: String, completion: @escaping (CurrenciesModel?, ErrorModel?) -> ()) {
        let queryItems  = [NSURLQueryItem(name: "base", value: fromCurrency),
                          NSURLQueryItem(name: "symbols", value: toCurrencies)]
        guard var urlComps = URLComponents(string: "\(baseUrl)latest") else {
        return
        }
        
        urlComps.queryItems = queryItems as [URLQueryItem]
        guard let url = urlComps.url else { return }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let data = data else {
                let error = NSError(domain: "", code: 201, userInfo: ["message": "Something went Worng"]) as Error
                completion(nil, error as? ErrorModel)
                print("something went wrong")
                return
            }
           
            do {
                let exchangeRateResults = try JSONDecoder().decode(CurrenciesModel.self, from: data)
                completion(exchangeRateResults, nil)
            } catch let apiError {
                print(apiError)
            }
        }).resume()
    }
}

struct CurrencyConverterModel: Decodable {
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

struct CurrenciesModel: Decodable {
    let rates: [String: Double]?
    let success: Bool
}

struct ErrorModel: Decodable {
    let success: Bool
    let error: ErrorInfo
}

struct ErrorInfo: Decodable {
    let code: Int
    let type: String
    let info: String
}

