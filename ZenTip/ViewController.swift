//
//  ViewController.swift
//  ZenTip
//
//  Created by Usuario on 23/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var partySize: UITextField!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var customTipTextField: UITextField!
    
    var split: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePartySize()
        setupPlaceholders()
        
        tipSegmentedControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        customTipTextField.isHidden = true
    }
    
    func setupPlaceholders() {
        partySize.placeholder = "Split"
    }

    @IBAction func decrementButtonTapped(_ sender: UIButton) {
        if split > 1 {
            split -= 1
            updatePartySize()
        }
    }
    
    @IBAction func incrementButtonTapped(_ sender: UIButton) {
        split += 1
        updatePartySize()
    }
    
    func updatePartySize() {
        partySize.text = split != 1 ? "\(split)" : ""
    }
    
    @IBAction func tipSegmentedControlChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 3 {
            customTipTextField.isHidden = false
        } else {
            customTipTextField.isHidden = true
            customTipTextField.text = ""
            }
        }
    
    @IBAction func didTapButton(_ sender: Any) {
        // Amount
        guard let totalAmount = Double(totalAmountTextField.text ?? "0"),
              let partySizeValue = Int(partySize.text ?? "1") else {
            return
        }
        
        var finalAmount = totalAmount
        var tipValue: Double = 0.0
        
        // Tip %
            if tipSegmentedControl.selectedSegmentIndex == 3 {
                if let customTipAmount = Double(customTipTextField.text ?? "0") {
                    tipValue = customTipAmount
                    finalAmount += customTipAmount
                }
            } else {
                let percentages = [0.10, 0.15, 0.20]
                let selectedTipPercentage = percentages[tipSegmentedControl.selectedSegmentIndex]
                tipValue = totalAmount * selectedTipPercentage
                finalAmount = totalAmount * (1 + selectedTipPercentage)
            }
            
            // Calculate the total with tip and the total per person
            let totalPerPerson = finalAmount / Double(partySizeValue)
            
            // Pass the calculated values to TipCalculatorViewController
            if let tipCalculatorVC = self.storyboard?.instantiateViewController(withIdentifier: "TipCalculatorViewController") as? TipCalculatorViewController {
                tipCalculatorVC.amount = totalAmount
                tipCalculatorVC.tipValue = tipValue
                tipCalculatorVC.partySize = partySizeValue
                tipCalculatorVC.totalWithTip = finalAmount
                tipCalculatorVC.totalPerPerson = totalPerPerson
                self.navigationController?.pushViewController(tipCalculatorVC, animated: true)
            }
    }
}
