//
//  CurrencyConverterViewController.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 19/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import UIKit
import SnapKit
import Foundation

class CurrencyConverterViewController: UIViewController {
    
    let myPickerData: [String] = ["AED",     "AFN",     "ALL",     "AMD",     "ANG",     "AOA",     "ARS",     "AUD",     "AWG",     "AZN",     "BAM",     "BBD",     "BDT",     "BGN",     "BHD",     "BIF",     "BMD",     "BND",     "BOB",     "BRL",     "BSD",     "BTC",     "BTN",     "BWP",     "BYN",     "BYR",     "BZD",     "CAD",     "CDF",     "CHF",     "CLF",     "CLP",     "CNY",     "COP",     "CRC",     "CUC",     "CUP",     "CVE",     "CZK",     "DJF",     "DKK",     "DOP",     "DZD",     "EGP",     "ERN",     "ETB",     "EUR",     "FJD",     "FKP",     "GBP",     "GEL",     "GGP",     "GHS",     "GIP",     "GMD",     "GNF",     "GTQ",     "GYD",     "HKD",     "HNL",     "HRK",     "HTG",     "HUF",     "IDR",     "ILS",     "IMP",     "INR",     "IQD",     "IRR",     "ISK",     "JEP",     "JMD",     "JOD",     "JPY",     "KES",     "KGS",     "KHR",     "KMF",     "KPW",     "KRW",     "KWD",     "KYD",     "KZT",     "LAK",     "LBP",     "LKR",     "LRD",     "LSL",     "LTL",     "LVL",     "LYD",     "MAD",     "MDL",     "MGA",     "MKD",     "MMK",     "MNT",     "MOP",     "MRO",     "MUR",     "MVR",     "MWK",     "MXN",     "MYR",     "MZN",     "NAD",     "NGN",     "NIO",     "NOK",     "NPR",     "NZD",     "OMR",     "PAB",     "PEN",     "PGK",     "PHP",     "PKR",     "PLN",     "PYG",     "QAR",     "RON",     "RSD",     "RUB",     "RWF",     "SAR",     "SBD",     "SCR",     "SDG",     "SEK",     "SGD",     "SHP",     "SLL",     "SOS",     "SRD",     "STD",     "SVC",     "SYP",     "SZL",     "THB",     "TJS",     "TMT",     "TND",     "TOP",     "TRY",     "TTD",     "TWD",     "TZS",     "UAH",     "UGX",     "USD",     "UYU",     "UZS",     "VEF",     "VND",     "VUV",     "WST",     "XAF",     "XAG",     "XAU",     "XCD",     "XDR",     "XOF",     "XPF",     "YER",     "ZAR",     "ZMK",     "ZMW",     "ZWL"]
    // var picker = UIPickerView()
    
    var appTitle:UILabel = {
        var title = UILabel()
        title.text = "Currency Converter2"
        title.font = UIFont(name:"Optima-Regular", size: 24)
        return title
    }()
    
    var fromCurrencyLabel:UILabel = {
        var fromCur = UILabel()
        fromCur.text = "From"
        fromCur.font = UIFont(name:"Optima-Regular", size: 17)
        return fromCur
    }()
    
    var toCurrencyLabel:UILabel = {
        var toCur = UILabel()
        toCur.text = "To"
        toCur.font = UIFont(name:"Optima-Regular", size: 17)
        return toCur
    }()
    
    var selectFromCountry: UITextField = {
        var fromCountry = UITextField()
        fromCountry.backgroundColor = UIColor.white
        return fromCountry
    }()
    
    var selectToCountry: UITextField = {
        var toCountry = UITextField()
        toCountry.backgroundColor = UIColor.white
        return toCountry
    }()
    
    var currencyLableValue:UILabel = {
        var currLabel = UILabel()
        currLabel.text = "Value"
        currLabel.font = UIFont(name:"Optima-Regular", size: 17)
        return currLabel
    }()
    
    var valueToBeConverted:UITextField = {
        var value = UITextField()
        value.backgroundColor = UIColor.white
        value.font = UIFont(name:"Optima-Regular", size: 17)
        return value
    }()
    
    var convertButton:UIButton = {
        var conBtn = UIButton()
        conBtn.setTitle("Convert", for: .normal)
        conBtn.backgroundColor = UIColor.orange
        conBtn.layer.cornerRadius = 10
        conBtn.layer.borderColor = UIColor.gray.cgColor
        conBtn.layer.borderWidth = 1.0
        conBtn.setTitleShadowColor(UIColor.black, for: .normal)
        conBtn.addTarget(self, action: #selector(convertButton(sender:)), for: .touchUpInside)
        return conBtn
    }()
    
    var convertedCurrency:UILabel = {
        var conCurrency = UILabel()
        conCurrency.backgroundColor = UIColor.white
        conCurrency.font = UIFont(name:"Optima-Regular", size: 25)
        return conCurrency
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer           = CAGradientLayer()
        layer.frame         = view.bounds
        layer.colors        = [UIColor.yellow.cgColor,UIColor.green.cgColor]
        layer.startPoint    = CGPoint(x: 0,y: 0)
        layer.endPoint      = CGPoint(x: 1,y: 2)
        view.layer.addSublayer(layer)
        
        //        picker.dataSource           = self
        //        picker.delegate             = self
        //        selectFromCountry.inputView = picker
        //        selectToCountry.inputView   = picker
        
        view.addSubview(appTitle)
        appTitle.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(fromCurrencyLabel)
        fromCurrencyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(50)
        }
        
        view.addSubview(toCurrencyLabel)
        toCurrencyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fromCurrencyLabel.snp.bottom).offset(20)
            make.top.equalTo(320)
            make.leading.equalToSuperview().offset(50)
        }
        
        view.addSubview(selectFromCountry)
        selectFromCountry.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        view.addSubview(selectToCountry)
        selectToCountry.snp.makeConstraints { (make) in
            make.top.equalTo(fromCurrencyLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        view.addSubview(currencyLableValue)
        currencyLableValue.snp.makeConstraints { (make) in
            make.top.equalTo(toCurrencyLabel.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(50)
        }
        
        view.addSubview(valueToBeConverted)
        valueToBeConverted.snp.makeConstraints { (make) in
            make.top.equalTo(selectToCountry.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        view.addSubview(convertButton)
        convertButton.snp.makeConstraints { (make) in
            make.top.equalTo(valueToBeConverted.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        view.addSubview(convertedCurrency)
        convertedCurrency.snp.makeConstraints { (make) in
            make.top.equalTo(convertButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
    }
    
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return myPickerData.count
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        selectFromCountry.text = myPickerData[row]
    //        //self.view.endEditing(true)
    //
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        return myPickerData[row]
    //    }
    
    
    @objc func convertButton(sender: UIButton) {
        let makeApiCall = CurrencyConversionModel()
        let computeFrom = selectFromCountry.text!
        let computeTo   = selectToCountry.text!
        let amount      = valueToBeConverted.text!
        
        makeApiCall.currencyCon(fromCurrency: computeFrom, toCurrency: computeTo, amount: amount ) { (CurrencyConverterModel) in
            showResult(amount: "\(CurrencyConverterModel.result)")
            
        }
        
        func showResult(amount: String) {
            DispatchQueue.main.async {
                self.convertedCurrency.text = amount
            }
        }
    }
}


