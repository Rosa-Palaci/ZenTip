//
//  TipCalculatorViewController.swift
//  ZenTip
//
//  Created by Usuario on 23/08/24.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var tipValueLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var totalWithTipLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    
    var amount: Double?
    var tipValue: Double?
    var partySize: Int?
    var totalWithTip: Double?
    var totalPerPerson: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let amount = amount,
           let tipValue = tipValue,
           let partySize = partySize,
           let totalWithTip = totalWithTip,
           let totalPerPerson = totalPerPerson {
            amountLabel.text = String(format: "$%.2f", amount)
            tipValueLabel.text = String(format: "$%.2f", tipValue)
            partySizeLabel.text = "\(partySize)"
            totalWithTipLabel.text = String(format: "$%.2f", totalWithTip)
            totalPerPersonLabel.text = String(format: "$%.2f", totalPerPerson)
            }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
