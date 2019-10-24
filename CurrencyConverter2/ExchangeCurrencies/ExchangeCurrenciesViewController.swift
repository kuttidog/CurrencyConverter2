//
//  exchangeCurrenciesViewController.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 21/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import UIKit

class ExchangeCurrenciesViewController: UIViewController {
    
    let viewModel: ExchangeCurrenciesViewable
    
    init(viewModel: ExchangeCurrenciesViewable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var appTitle:UILabel = {
        var title = UILabel()
        title.text = "Exchange Rates"
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
        fromCountry.placeholder = "like GBP"
        fromCountry.backgroundColor = UIColor.white
        fromCountry.font = UIFont(name:"Optima-Regular", size: 13)
        return fromCountry
    }()
    
    var selectToCountry: UITextField = {
        var toCountry = UITextField()
        toCountry.placeholder = "like GBP,USD,INR"
        toCountry.font = UIFont(name:"Optima-Regular", size: 13)
        toCountry.backgroundColor = UIColor.white
        return toCountry
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
                make.width.equalTo(180)
                make.height.equalTo(30)
            }
            
            view.addSubview(selectToCountry)
            selectToCountry.snp.makeConstraints { (make) in
                make.top.equalTo(fromCurrencyLabel.snp.bottom).offset(20)
                make.centerX.equalToSuperview()
                make.width.equalTo(180)
                make.height.equalTo(30)
            }
            
            view.addSubview(convertButton)
            convertButton.snp.makeConstraints { (make) in
                make.top.equalTo(toCurrencyLabel.snp.bottom).offset(20)
                make.centerX.equalToSuperview()
                make.width.equalTo(150)
                make.height.equalTo(50)
            }
        }
    
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return myPickerData.count
    //    }
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        selectFromCountry.text = myPickerData[row]
    //        //self.view.endEditing(true)
    //    }
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        return myPickerData[row]
    //    }
    
    
    @objc func convertButton(sender: UIButton) {
 //       let makeApiCall = CurrencyConversionModel()
        let computeFrom = selectFromCountry.text!
        let computeTo   = selectToCountry.text!
        let pushNVC     = ExchangeResultTableViewController()
        
        viewModel.exchangeCurrencies(fromCurrency: computeFrom, toCurrencies: computeTo) { (exchangeRates, error) in
            var currency:[String] = []
            if let exchangeRates = exchangeRates {
                for (key, value) in exchangeRates {
                    currency.append("\(key) - \(value)")
                }
                DispatchQueue.main.async {
                    pushNVC.currencies = currency
                    self.navigationController?.pushViewController(pushNVC, animated: true)
                }
            }
            
            if let error = error {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Currency Convertor", message: error.errorMessage(), preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}

