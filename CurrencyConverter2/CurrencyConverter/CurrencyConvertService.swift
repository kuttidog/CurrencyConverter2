//
//  File.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 23/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation

protocol CurrencyConverterServiceable {
    func convertCurrencyAPI(fromCurrency: String,
                            toCurrency: String,
                            amount: String,
                            completion: @escaping (CurrencyConverterModel?, ServiceError?) -> ())
}
class CurrencyConvertService: CurrencyConverterServiceable {
    
    
    private let headers = ["x-rapidapi-host" : "fixer-fixer-currency-v1.p.rapidapi.com",
                           "x-rapidapi-key" : "fdd1a62164mshaa7d08ea69d24bdp117f0ejsn84495048cb87"]
    private let baseUrl = "https://fixer-fixer-currency-v1.p.rapidapi.com/"
    
func convertCurrencyAPI(fromCurrency: String, toCurrency: String, amount: String, completion: @escaping (CurrencyConverterModel?, ServiceError?) -> ()) {
    let queryItems = [NSURLQueryItem(name: "from", value: fromCurrency),
                      NSURLQueryItem(name: "to", value: toCurrency),
                      NSURLQueryItem(name: "amount", value: amount)]
    guard var urlcomps = URLComponents(string: "\(baseUrl)convert") else {
        return
    }
    urlcomps.queryItems = queryItems as [URLQueryItem]
    guard let url = urlcomps.url else {return}
    
    var request = URLRequest(url: url)
    request.allHTTPHeaderFields = headers
    request.httpMethod = "GET"
    URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
        if let error = error {
            completion(nil, ServiceError.networkIssue(error))
            return
        }
        guard let data = data else {
            completion(nil, ServiceError.emptyResponse)
            return
        }
        do {
            let result = try JSONDecoder().decode(CurrencyConverterModel.self, from: data)
            if result.success {
                     completion(result, nil)
                
            } else {
                // let error = try JSONDecoder().decode(CurrenciesModel.self, from: data)
//                completion(nil, ServiceError.serviceError(error))
            }
        }
        catch {
            completion(nil, ServiceError.decodingError)
        } }).resume()
}

}
