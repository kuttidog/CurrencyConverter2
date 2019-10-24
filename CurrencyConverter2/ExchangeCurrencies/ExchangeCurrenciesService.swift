//
//  File.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 24/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation

protocol ExchangeCurrenciesServiceable {
    func exchangeCurrencies(fromCurrency: String, toCurrencies: String, completion: @escaping (_ report: [String : Double]?, ServiceError?) -> ())
}


class ExchangeCurrenciesService: ExchangeCurrenciesServiceable {
    
    private let headers = ["x-rapidapi-host" : "fixer-fixer-currency-v1.p.rapidapi.com",
                           "x-rapidapi-key" : "fdd1a62164mshaa7d08ea69d24bdp117f0ejsn84495048cb87"]
    private let baseUrl = "https://fixer-fixer-currency-v1.p.rapidapi.com/"

func exchangeCurrencies(fromCurrency: String, toCurrencies: String, completion: @escaping ([String : Double]?, ServiceError?) -> ()) {
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
        if let error = error {
            completion(nil, ServiceError.networkIssue(error))
            return
        }
        
        guard let data = data else {
            completion(nil, ServiceError.emptyResponse) //serviceResponse -> switch case
            return
        }
        
        do {
            let exchangeRateResults = try JSONDecoder().decode(CurrenciesModel.self, from: data)
            guard exchangeRateResults.success, let rates = exchangeRateResults.rates else {
                completion(nil, ServiceError.serviceError(exchangeRateResults.error?.info))
                return
            }
            
            completion(rates, nil)
        } catch {
            completion(nil, ServiceError.decodingError)
        }
    }).resume()
}

}
