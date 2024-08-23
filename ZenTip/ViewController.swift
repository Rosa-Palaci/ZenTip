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
    var split: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configurar el placeholder
        partySize.placeholder = "Party Size"
        
        // Inicializar el valor del campo de texto
        updatePartySize()
    }

    @IBAction func decrementButtonTapped(_ sender: UIButton) {
        if split > 1 {  // Asegurarse de que el valor no sea menor que 1
            split -= 1
            updatePartySize()
        }
    }
    
    @IBAction func incrementButtonTapped(_ sender: UIButton) {
        split += 1  // Incrementar el valor de split
        updatePartySize()
    }
    
    func updatePartySize() {
        partySize.text = "\(split)"  // Actualizar el campo de texto con el valor de split
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        // Obtener los valores ingresados
        guard let totalAmount = Double(totalAmountTextField.text ?? "0"),
              let partySizeValue = Int(partySize.text ?? "1") else {
            return
        }
        
        // Obtener el porcentaje de propina seleccionado
        let percentages = [0.10, 0.15, 0.20]
        var selectedTipPercentage = 0.0
        
        if tipSegmentedControl.selectedSegmentIndex == 3 {
            selectedTipPercentage = 0.18 // Valor por defecto si se selecciona "Otro"
        } else {
            selectedTipPercentage = percentages[tipSegmentedControl.selectedSegmentIndex]
        }
        
        // Calcular el total con propina y el total por persona
        let totalWithTip = totalAmount * (1 + selectedTipPercentage)
        let totalPerPerson = totalWithTip / Double(partySizeValue)
        
        // Pasar los valores calculados a TipCalculatorViewController
        if let tipCalculatorVC = self.storyboard?.instantiateViewController(withIdentifier: "TipCalculatorViewController") as? TipCalculatorViewController {
                    tipCalculatorVC.totalWithTip = totalWithTip
                    tipCalculatorVC.totalPerPerson = totalPerPerson
                    self.navigationController?.pushViewController(tipCalculatorVC, animated: true)
        }
    }
}
