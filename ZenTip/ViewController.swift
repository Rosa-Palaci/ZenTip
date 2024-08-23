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
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        partySize.placeholder = "Party Size"
        
        // Inicializar el valor del stepper
        partySizeStepper.value = 0
    }
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        partySize.text = "\(Int(sender.value))"
    }


    @IBAction func didTapButton(_ sender: Any) {
        // Total Amount and party size
        guard let totalAmount = Double(totalAmountTextField.text ?? "0"),
              let partySize = Int(partySize.text ?? "1") else {
            return
        }
        
        // Tip %
        let percentages = [0.10, 0.15, 0.20]
        var selectedTipPercentage = 0.0
        
        if tipSegmentedControl.selectedSegmentIndex == 3 {
            selectedTipPercentage = 0.18 //example
        } else {
            selectedTipPercentage = percentages[tipSegmentedControl.selectedSegmentIndex]
        }
        
        //Calcule Total with tip
        let totalWithTip = totalAmount * (1 + selectedTipPercentage)
        let totalPerPerson = totalWithTip / Double(partySize)
        
        // Pass values to TipCalculatorViewController
        
        if let tipCalculatorVC = self.storyboard?.instantiateViewController(withIdentifier: "TipCalculatorViewController") as? TipCalculatorViewController {
                    tipCalculatorVC.totalWithTip = totalWithTip
                    tipCalculatorVC.totalPerPerson = totalPerPerson
                    self.navigationController?.pushViewController(tipCalculatorVC, animated: true)
        }
    }

}

