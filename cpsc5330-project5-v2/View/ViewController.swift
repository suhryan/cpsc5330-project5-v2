//
//  ViewController.swift
//  cpsc5330-project5-v2
//
//  Created by ryan suh on 11/18/23.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var currency1Switch: UISwitch!
    @IBOutlet weak var currency2Switch: UISwitch!
    @IBOutlet weak var currency3Switch: UISwitch!
    @IBOutlet weak var currency4Switch: UISwitch!
    
    @IBOutlet weak var convertButton: UIButton!
    
    var selectedCurrencies: [String] {
        var currencies = [String]()
        if currency1Switch.isOn { currencies.append("EUR") }
        if currency2Switch.isOn { currencies.append("GBP") }
        if currency3Switch.isOn { currencies.append("JPY") }
        if currency4Switch.isOn { currencies.append("CAD") }
        return currencies
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.amountInUSD = Int(amountTextField.text ?? "") ?? 0
            resultsVC.selectedCurrencies = selectedCurrencies
        }
    }
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {

            // Validate that at least one currency is selected
            if selectedCurrencies.isEmpty {
                errorLabel.text = "Please select at least one currency."
                return
            }

            // Validate input is an integer
            guard let amountText = amountTextField.text, !amountText.isEmpty, let _ = Int(amountText) else {
                errorLabel.text = "Invalid input. Integer Only."
                return
            }

            // Clear any previous error messages
            errorLabel.text = ""

            // Perform the segue if validation passes
            self.performSegue(withIdentifier: "showResults", sender: self)
 
    }
}

