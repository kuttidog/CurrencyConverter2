//
//  ViewController.swift
//  CurrencyConverter2
//
//  Created by Kulanthaivel, Myl (.) on 19/10/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import UIKit
import SnapKit
import Foundation

class ViewController: UIViewController {
    
    
    var appTitle:UILabel = {
        var title = UILabel()
        title.text = "FOREX"
        title.font = UIFont(name:"Optima-Regular", size: 24)
        return title
    }()
    
    var convertCurrency:UIButton = {
        var conBtn = UIButton()
        conBtn.setTitle("Convert Currency", for: .normal)
        conBtn.backgroundColor = UIColor.orange
        conBtn.layer.cornerRadius = 10
        conBtn.layer.borderColor = UIColor.gray.cgColor
       // conBtn.layer.borderWidth = 1.0
        conBtn.setTitleShadowColor(UIColor.black, for: .normal)
        conBtn.addTarget(self, action: #selector(convertCurrency(sender:)), for: .touchUpInside)
        return conBtn
    }()
 
    var exchangeCurrencies:UIButton = {
        var conBtn = UIButton()
        conBtn.setTitle("Exchange Currency", for: .normal)
        conBtn.backgroundColor = UIColor.orange
        conBtn.layer.cornerRadius = 10
        conBtn.layer.borderColor = UIColor.gray.cgColor
        //conBtn.layer.borderWidth = 1.0
        conBtn.setTitleShadowColor(UIColor.black, for: .normal)
        conBtn.addTarget(self, action: #selector(exchangeCurrencies(sender:)), for: .touchUpInside)
        return conBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundGradient()
        
        view.addSubview(appTitle)
        appTitle.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(convertCurrency)
        convertCurrency.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        view.addSubview(exchangeCurrencies)
        exchangeCurrencies.snp.makeConstraints { (make) in
            make.top.equalTo(convertCurrency.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    
    @objc func convertCurrency(sender: UIButton) {
        let vc = CurrencyConverterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func exchangeCurrencies(sender: UIButton) {
        
        let vc = exchangeCurrenciesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = true
//    }
    
    func backgroundGradient() {
        let layer           = CAGradientLayer()
        layer.frame         = view.bounds
        layer.colors        = [UIColor.yellow.cgColor,UIColor.green.cgColor]
        layer.startPoint    = CGPoint(x: 0,y: 0)
        layer.endPoint      = CGPoint(x: 1,y: 2)
        view.layer.addSublayer(layer)
    }
}

//extension UIView {
//
//    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = bounds
//        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
//        layer.insertSublayer(gradientLayer, at: 0)
//    }
//}

