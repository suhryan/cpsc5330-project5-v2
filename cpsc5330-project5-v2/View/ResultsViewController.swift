//
//  ResultsViewController.swift
//  cpsc5330-project5-v2
//
//  Created by ryan suh on 11/18/23.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var usdAmountLabel: UILabel! //remove-used for testing

    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var currency1Label: UILabel! //remove-used for testing
    @IBOutlet weak var currency2Label: UILabel! //remove-used for testing
    @IBOutlet weak var currency3Label: UILabel! //remove-used for testing
    @IBOutlet weak var currency4Label: UILabel! //remove-used for testing

    var amountInUSD: Int = 0
    var selectedCurrencies: [String] = []
    var currencyLabels = [UILabel]()
    var currencyLabelPairs = [(UILabel, UILabel)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCurrencyLabels()
    }
    
    private func setupCurrencyLabels() {
        let converter = CurrencyConverter()
        usdLabel.text = "Amount in USD: \(String(format: "%.2f", Double(amountInUSD)))"
        
        // Remove old labels if they exist
        for pair in currencyLabelPairs {
            pair.0.removeFromSuperview()
            pair.1.removeFromSuperview()
        }
        currencyLabelPairs.removeAll()
        
        // Dynamically create a pair of UILabels for each selected currency
        for (index, currency) in selectedCurrencies.enumerated() {
            let convertedAmount = converter.convert(amountInUSD: amountInUSD, toCurrency: currency)
            let formattedAmount = String(format: "%.2f", convertedAmount) // Format to two decimal places
            
            // Create the currency name label
            let currencyLabel = UILabel()
            currencyLabel.translatesAutoresizingMaskIntoConstraints = false
            currencyLabel.text = "\(currency):"
            currencyLabel.textAlignment = .left
            
            // Create the amount label
            let amountLabel = UILabel()
            amountLabel.translatesAutoresizingMaskIntoConstraints = false
            amountLabel.text = formattedAmount
            amountLabel.textAlignment = .right
            
            view.addSubview(currencyLabel)
            view.addSubview(amountLabel)
            currencyLabelPairs.append((currencyLabel, amountLabel))
            
            // Constraints for the currency label
            currencyLabel.topAnchor.constraint(equalTo: usdLabel.bottomAnchor, constant: CGFloat(20 + (index * 40))).isActive = true
            currencyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            currencyLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -30).isActive = true
            
            // Constraints for the amount label
            amountLabel.topAnchor.constraint(equalTo: currencyLabel.topAnchor).isActive = true
            amountLabel.leadingAnchor.constraint(equalTo: currencyLabel.trailingAnchor, constant: 10).isActive = true
            amountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        }
    }
}

