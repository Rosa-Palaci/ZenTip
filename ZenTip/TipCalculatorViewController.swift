//
//  TipCalculatorViewController.swift
//  ZenTip
//
//  Created by Usuario on 23/08/24.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    @IBOutlet weak var totalWithTipLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    
    var totalWithTip: Double?
    var totalPerPerson: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let totalWithTip = totalWithTip, let totalPerPerson = totalPerPerson {
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
