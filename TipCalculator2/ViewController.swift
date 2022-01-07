//
//  ViewController.swift
//  TipCalculator2
//
//  Created by ZZ on 10/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    //automatic calculation~removal of button in future
    
    let tipPercentData: [Double] = [0.10, 0.15, 0.20, 0.25]
    var tipPercent: Double = 0.10
    
    
    //MARK: - Variables
    //MARK: - IB Outlets
    
    @IBOutlet weak var billTotalLabel: UILabel!
    @IBOutlet weak var tipTotalLabel: UILabel!
    @IBOutlet weak var tipSegmentControl: UISegmentedControl!
    @IBOutlet weak var amountTextField: UITextField!
    
    //MARK: - IB Actions
    //ib action is dependent on user control and action
    
    @IBAction func didTapCalculateButton(_ sender: Any) {
        
        //print("Calculate button tapped")
        
        
        if amountTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            print("invalid entry for amount text field")
            return
        }
        
        let billString = amountTextField.text!
        
        guard let billAmount = Double(billString) else {return}
            
        
        let tipAmount = billAmount * tipPercent
        let amountTotal = billAmount + tipAmount
        
        tipTotalLabel.text = String(format: "$%.2f", tipAmount)
        billTotalLabel.text = String(format: "$%.2f", amountTotal)
        
        view.endEditing(true)
        }
        
        
    @IBAction func didTapSegmentControl(_ sender: Any) {
        
        //if we input all the calculate button login into here then there would probably be no need for the calculate button and calculation can be done
        //basically automatically
        
        tipPercent = tipPercentData[tipSegmentControl.selectedSegmentIndex]
        didTapCalculateButton(tipPercent)
        
    }
    
    //MARK: - View LifeCyles
    //viewDidLoad is basically all about like on instagram they would display a
    //method saying "go fetch the data for the feed" so the code would go into the
    //database and grab those images and more for your feed ~ basically it is not
    //user dependent unlike the IB actions

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

