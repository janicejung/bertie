//
//  SetBudgetViewController.swift
//  BudgetingApp
//
//  Created by Janice Jung on 11/20/19.
//  Copyright © 2019 Janice Jung. All rights reserved.
//

import UIKit

class SetBudgetViewController: UIViewController, UITextFieldDelegate {
    
    var amountPerMonthLabel: UILabel!
    var selectCategoryLabel: UILabel!
    var amountTextField: UITextField!
    var foodButton: UIButton!
    var entertainmentButton: UIButton!
    var billsButton: UIButton!
    var groceriesButton: UIButton!
    var shopButton: UIButton!
    var transportButton: UIButton!
    var otherButton: UIButton!
    var createButton: UIButton!
    
    weak var delegate: pushModallyDelegate?
    
    var selectedCat: Int?
        
    let buttonWidth = 150
    let buttonHeight = 40
    let padding = 20
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        view.backgroundColor = .white
        view.layer.cornerRadius = 40

        selectCategoryLabel = UILabel()
        selectCategoryLabel.text = "Select Category"
        selectCategoryLabel.textAlignment = .center
        selectCategoryLabel.textColor = .main
        selectCategoryLabel.font = .systemFont(ofSize: 23, weight: .medium)
        view.addSubview(selectCategoryLabel)
            
        amountPerMonthLabel = UILabel()
        amountPerMonthLabel.text = "Amount Per Month"
        amountPerMonthLabel.textAlignment = .center
        amountPerMonthLabel.textColor = .main
        amountPerMonthLabel.font = .systemFont(ofSize: 25, weight: .medium)
        view.addSubview(amountPerMonthLabel)
            
        amountTextField = UITextField()
        amountTextField.attributedPlaceholder = NSAttributedString(string: "$0.00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.meta])
        amountTextField.textColor = .secondary
        amountTextField.font = .systemFont(ofSize: 50, weight: .medium)
        view.addSubview(amountTextField)
            
        foodButton = UIButton()
        foodButton.layer.masksToBounds = true
        foodButton.setTitle("Food", for: .normal)
        foodButton.layer.cornerRadius = CGFloat(buttonHeight/2)
        foodButton.layer.borderWidth = 2
        foodButton.layer.borderColor = UIColor.secondary.cgColor
        foodButton.setTitleColor(.secondary, for: .normal)
        foodButton.setTitleColor(.white, for: .selected)
        foodButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        foodButton.contentHorizontalAlignment = .center
        foodButton.contentVerticalAlignment = .center
        foodButton.setBackgroundImage(UIImage(named: "white"), for: .normal)
        foodButton.setBackgroundImage(UIImage(named: "secondary"), for: .selected)
        foodButton.addTarget(self, action: #selector(foodButtonPressed), for: .touchUpInside)
        view.addSubview(foodButton)
            
        entertainmentButton = UIButton()
        entertainmentButton.layer.masksToBounds = true
        entertainmentButton.setTitle("Entertainment", for: .normal)
        entertainmentButton.layer.cornerRadius = CGFloat(buttonHeight/2)
        entertainmentButton.layer.borderWidth = 2
        entertainmentButton.layer.borderColor = UIColor.secondary.cgColor
        entertainmentButton.setTitleColor(.secondary, for: .normal)
        entertainmentButton.setTitleColor(.white, for: .selected)
        entertainmentButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        entertainmentButton.contentHorizontalAlignment = .center
        entertainmentButton.contentVerticalAlignment = .center
        entertainmentButton.setBackgroundImage(UIImage(named: "white"), for: .normal)
        entertainmentButton.setBackgroundImage(UIImage(named: "secondary"), for: .selected)
        entertainmentButton.addTarget(self, action: #selector(entertainmentButtonPressed), for: .touchUpInside)
        view.addSubview(entertainmentButton)
        
        billsButton = UIButton()
        billsButton.layer.masksToBounds = true
        billsButton.setTitle("Bills", for: .normal)
        billsButton.layer.cornerRadius = CGFloat(buttonHeight/2)
        billsButton.layer.borderWidth = 2
        billsButton.layer.borderColor = UIColor.secondary.cgColor
        billsButton.setTitleColor(.secondary, for: .normal)
        billsButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        billsButton.setTitleColor(.white, for: .selected)
        billsButton.contentHorizontalAlignment = .center
        billsButton.contentVerticalAlignment = .center
        billsButton.setBackgroundImage(UIImage(named: "white"), for: .normal)
        billsButton.setBackgroundImage(UIImage(named: "secondary"), for: .selected)
        billsButton.addTarget(self, action: #selector(billsButtonPressed), for: .touchUpInside)
        view.addSubview(billsButton)
        
        groceriesButton = UIButton()
        groceriesButton.layer.masksToBounds = true
        groceriesButton.setTitle("Groceries", for: .normal)
        groceriesButton.layer.cornerRadius = CGFloat(buttonHeight/2)
        groceriesButton.layer.borderWidth = 2
        groceriesButton.layer.borderColor = UIColor.secondary.cgColor
        groceriesButton.setTitleColor(.secondary, for: .normal)
        groceriesButton.setTitleColor(.white, for: .selected)
        groceriesButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        groceriesButton.contentHorizontalAlignment = .center
        groceriesButton.contentVerticalAlignment = .center
        groceriesButton.setBackgroundImage(UIImage(named: "white"), for: .normal)
        groceriesButton.setBackgroundImage(UIImage(named: "secondary"), for: .selected)
        groceriesButton.addTarget(self, action: #selector(groceriesButtonPressed), for: .touchUpInside)
        view.addSubview(groceriesButton)
        
        shopButton = UIButton()
        shopButton.layer.masksToBounds = true
        shopButton.setTitle("Shop", for: .normal)
        shopButton.layer.cornerRadius = CGFloat(buttonHeight/2)
        shopButton.layer.borderWidth = 2
        shopButton.layer.borderColor = UIColor.secondary.cgColor
        shopButton.setTitleColor(.secondary, for: .normal)
        shopButton.setTitleColor(.white, for: .selected)
        shopButton.contentHorizontalAlignment = .center
        shopButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        shopButton.contentVerticalAlignment = .center
        shopButton.setBackgroundImage(UIImage(named: "white"), for: .normal)
        shopButton.setBackgroundImage(UIImage(named: "secondary"), for: .selected)
        shopButton.addTarget(self, action: #selector(shopButtonPressed), for: .touchUpInside)
        view.addSubview(shopButton)
        
        transportButton = UIButton()
        transportButton.layer.masksToBounds = true
        transportButton.setTitle("Transport", for: .normal)
        transportButton.layer.cornerRadius = CGFloat(buttonHeight/2)
        transportButton.layer.borderWidth = 2
        transportButton.layer.borderColor = UIColor.secondary.cgColor
        transportButton.setTitleColor(.secondary, for: .normal)
        transportButton.setTitleColor(.white, for: .selected)
        transportButton.contentHorizontalAlignment = .center
        transportButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        transportButton.contentVerticalAlignment = .center
        transportButton.setBackgroundImage(UIImage(named: "white"), for: .normal)
        transportButton.setBackgroundImage(UIImage(named: "secondary"), for: .selected)
        transportButton.addTarget(self, action: #selector(transportButtonPressed), for: .touchUpInside)
        view.addSubview(transportButton)
        
        otherButton = UIButton()
        otherButton.layer.masksToBounds = true
        otherButton.setTitle("Other", for: .normal)
        otherButton.layer.cornerRadius = CGFloat(buttonHeight/2)
        otherButton.layer.borderWidth = 2
        otherButton.layer.borderColor = UIColor.secondary.cgColor
        otherButton.setTitleColor(.secondary, for: .normal)
        otherButton.setTitleColor(.white, for: .selected)
        otherButton.contentHorizontalAlignment = .center
        otherButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        otherButton.contentVerticalAlignment = .center
        otherButton.setBackgroundImage(UIImage(named: "white"), for: .normal)
        otherButton.setBackgroundImage(UIImage(named: "secondary"), for: .selected)
        otherButton.addTarget(self, action: #selector(otherButtonPressed), for: .touchUpInside)
        view.addSubview(otherButton)
        
        createButton = UIButton()
        createButton.setTitle("Create", for: .normal)
        createButton.layer.cornerRadius = CGFloat(buttonHeight/3)
        createButton.layer.borderWidth = 2
        createButton.layer.borderColor = UIColor.accentGreen.cgColor
        createButton.setTitleColor(.accentGreen, for: .normal)
        createButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium)
        createButton.contentHorizontalAlignment = .center
        createButton.contentVerticalAlignment = .center
        createButton.setBackgroundImage(UIImage(named: "white"), for: .normal)
        createButton.addTarget(self, action: #selector(createButtonPressed), for: .touchUpInside)
        view.addSubview(createButton)

        setupConstraints()
    }

    
    func setupConstraints() {
        selectCategoryLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(80)
            make.centerX.equalTo(view)
        }
        
        foodButton.snp.makeConstraints { make in
            make.top.equalTo(selectCategoryLabel.snp.bottom).offset(padding)
            make.right.equalTo(view.snp.centerX).offset(-10)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
        entertainmentButton.snp.makeConstraints { make in
            make.top.equalTo(foodButton)
            make.left.equalTo(view.snp.centerX).offset(10)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
        billsButton.snp.makeConstraints { make in
            make.top.equalTo(foodButton.snp.bottom).offset(padding)
            make.right.equalTo(view.snp.centerX).offset(-10)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
        groceriesButton.snp.makeConstraints { make in
            make.top.equalTo(billsButton)
            make.left.equalTo(view.snp.centerX).offset(10)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
        shopButton.snp.makeConstraints { make in
            make.top.equalTo(billsButton.snp.bottom).offset(padding)
            make.right.equalTo(view.snp.centerX).offset(-10)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
        transportButton.snp.makeConstraints { make in
            make.top.equalTo(shopButton)
            make.left.equalTo(view.snp.centerX).offset(10)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
        otherButton.snp.makeConstraints { make in
            make.top.equalTo(shopButton.snp.bottom).offset(padding)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
        amountPerMonthLabel.snp.makeConstraints { make in
            make.top.equalTo(otherButton.snp.bottom).offset(80)
            make.centerX.equalTo(view)
        }
        amountTextField.snp.makeConstraints { make in
            make.top.equalTo(amountPerMonthLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
        
        createButton.snp.makeConstraints { make in
            make.width.equalTo(190)
            make.height.equalTo(60)
            make.centerX.equalTo(view)
            make.top.equalTo(amountTextField.snp.bottom).offset(40)
        }
        
    }
    
    @objc func foodButtonPressed() {
        if foodButton.isSelected {
            foodButton.isSelected = false
            selectedCat = nil
        } else {
            foodButton.isSelected = true
            selectedCat = 0
        }
    }
    
    @objc func entertainmentButtonPressed() {
        if entertainmentButton.isSelected {
            entertainmentButton.isSelected = false
            selectedCat = nil
        } else {
            entertainmentButton.isSelected = true
            selectedCat = 1
        }
    }
    
    @objc func billsButtonPressed() {
        if billsButton.isSelected {
            billsButton.isSelected = false
            selectedCat = nil
        } else {
            billsButton.isSelected = true
            selectedCat = 2
        }
    }
    
    @objc func groceriesButtonPressed() {
        if groceriesButton.isSelected {
            groceriesButton.isSelected = false
            selectedCat = nil
        } else {
            groceriesButton.isSelected = true
            selectedCat = 3
        }
    }
    
    @objc func shopButtonPressed() {
        if shopButton.isSelected {
            shopButton.isSelected = false
            selectedCat = nil
        } else {
            shopButton.isSelected = true
            selectedCat = 4
        }
    }
    
    @objc func transportButtonPressed() {
        if transportButton.isSelected {
            transportButton.isSelected = false
            selectedCat = nil
        } else {
            transportButton.isSelected = true
            selectedCat = 5
        }
    }
    
    @objc func otherButtonPressed() {
        if otherButton.isSelected {
            otherButton.isSelected = false
            selectedCat = nil
        } else {
            otherButton.isSelected = true
            selectedCat = 6
        }
    }
    
    @objc func createButtonPressed() {
        if let tag = selectedCat, let limitString = amountTextField.text {
            print(tag)
            print(limitString)
            let user = Statics.user!
            NetworkManager.createBudget(userID: user.user_id, tagID: tag, limit: limitString) { budget in
                
                print("budget successfully created")
                
                self.delegate?.createBudget(budget: budget)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    

}
