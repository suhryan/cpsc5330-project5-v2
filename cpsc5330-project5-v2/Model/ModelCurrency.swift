//
//  ModelCurrency.swift
//  cpsc5330-project5-v2
//
//  Created by ryan suh on 11/18/23.
//

import Foundation

struct CurrencyConverter {
    // Static dictionary to hold currency conversion rates
    static let rates: [String: Double] = [
        "EUR": 1.0915, // exchange rate for USD to Euro as of 11/19/2023 from Bloomberg
        "GBP": 1.2462, // exchange rate for USD to British Pound as of 11/19/2023 from Bloomberg
        "JPY": 149.6300, // exchange rate for USD to Japanese Yen as of 11/19/2023 from Bloomberg
        "CAD": 1.3723 // exchange rate for USD to Canadian Dollar as of 11/19/2023 from Bloomberg
    ]
    
    // Function to convert the amount from USD to the selected currency
    func convert(amountInUSD: Int, toCurrency currency: String) -> Double {
        guard let rate = CurrencyConverter.rates[currency] else {
            fatalError("Currency rate not found for \(currency)")
        }
        return Double(amountInUSD) * rate
    }
}
