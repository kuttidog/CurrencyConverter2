//
//  CurrencyConverterModel.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 19/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

enum ServiceError: Error {
    case networkIssue(Error)
    case emptyResponse
    case decodingError
    case serviceError(String?)
    case unknown
    
    func errorMessage() -> String {
        switch self {
        case .networkIssue(let error):
            return error.localizedDescription
        case .emptyResponse:
            return "Response was empty"
        case .decodingError:
            return "Couldn't decode the response"
        case .serviceError(let message):
            return message ?? "Something went wrong!"
        case .unknown:
            return "Catch Issue"
        }
    }
}
//
//import Foundation
////
////  CurrencyConversionModel.swift
////  CurrencyConverter
////
////  Created by Kulanthaivel, Myl (.) on 18/10/19.
////  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
////
//
//protocol CurrencyConverterService {
//    
//   func currencyCon(fromCurrency: String, toCurrency: String, amount: String, completion: @escaping (CurrencyConverterModel?, ServiceError?) -> ())
//    func exchangeCurrencies(fromCurrency: String, toCurrencies: String, completion: @escaping (_ report: [String : Double]?, ServiceError?) -> ())
//}
//
//class CurrencyConversionModel: CurrencyConverterService {
//    private let headers = ["x-rapidapi-host" : "fixer-fixer-currency-v1.p.rapidapi.com",
//                           "x-rapidapi-key" : "fdd1a62164mshaa7d08ea69d24bdp117f0ejsn84495048cb87"]
//    
//    private let baseUrl = "https://fixer-fixer-currency-v1.p.rapidapi.com/"
//   
//   func currencyCon(fromCurrency: String, toCurrency: String, amount: String, completion: @escaping (CurrencyConverterModel?, ServiceError?) -> ()) {
//////        let url = "https://fixer-fixer-currency-v1.p.rapidapi.com/convert?from=\(fromCurrency)&to=\(toCurrency)&amount=\(amount)"
//////        let urlRequester = URL(string: url)!
//////        var request = URLRequest(url: urlRequester)
//////        request.httpMethod = "GET"
//////        request.addValue("fdd1a62164mshaa7d08ea69d24bdp117f0ejsn84495048cb87",forHTTPHeaderField: "x-rapidapi-key")
//////        request.addValue("fixer-fixer-currency-v1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
////        let queryItems = [NSURLQueryItem(name: "from", value: fromCurrency),
////                          NSURLQueryItem(name: "to", value: toCurrency),
////                          NSURLQueryItem(name: "amount", value: amount)]
////        guard var urlcomps = URLComponents(string: "\(baseUrl)convert") else {
////            return
////        }
////        urlcomps.queryItems = queryItems as [URLQueryItem]
////        guard let url = urlcomps.url else {return}
////
////        var request = URLRequest(url: url)
////        request.allHTTPHeaderFields = headers
////        request.httpMethod = "GET"
////        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
////            if let error = error {
////                completion(nil, ServiceError.networkIssue(error))
////                return
////            }
////            guard let data = data else {
////               completion(nil, ServiceError.emptyResponse)
////                return
////            }
////            do{
////                let result = try JSONDecoder().decode(CurrencyConverterModel.self, from: data)
////                guard result.success, let resultAmount = result.result else {
////                   // let error = try JSONDecoder().decode(CurrenciesModel.self, from: data)
////                    completion(nil, ServiceError.serviceError(error))
////                    return }
////                completion(resultAmount, nil)
////            }
////            catch {
////                completion(nil, ServiceError.decodingError)
////            } }).resume()
//   }
//    
//    func exchangeCurrencies(fromCurrency: String, toCurrencies: String, completion: @escaping ([String : Double]?, ServiceError?) -> ()) {
//        let queryItems  = [NSURLQueryItem(name: "base", value: fromCurrency),
//                          NSURLQueryItem(name: "symbols", value: toCurrencies)]
//        guard var urlComps = URLComponents(string: "\(baseUrl)latest") else {
//            return
//        }
//        
//        urlComps.queryItems = queryItems as [URLQueryItem]
//        guard let url = urlComps.url else { return }
//        
//        var request = URLRequest(url: url)
//        request.allHTTPHeaderFields = headers
//        request.httpMethod = "GET"
//        
//        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
//            if let error = error {
//                completion(nil, ServiceError.networkIssue(error))
//                return
//            }
//            
//            guard let data = data else {
//                completion(nil, ServiceError.emptyResponse) //serviceResponse -> switch case
//                return
//            }
//            
//            do {
//                let exchangeRateResults = try JSONDecoder().decode(CurrenciesModel.self, from: data)
//                guard exchangeRateResults.success, let rates = exchangeRateResults.rates else {
//                    completion(nil, ServiceError.serviceError(exchangeRateResults.error?.info))
//                    return
//                }
//                
//                completion(rates, nil)
//            } catch {
//                completion(nil, ServiceError.decodingError)
//            }
//        }).resume()
//    }
//}
//
//

