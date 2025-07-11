//
//  Double+Extension.swift
//  AppTemplatesiOS
//
//  Created by Rezaul Islam on 11/7/25.
//

import Foundation

extension Double {
    var isEmpty : Bool {
            return self <= 0
        }
    
    func roundedString() -> String {
        let decimalPlaces: Int = 0
        return String(format: "%.\(decimalPlaces)f", self)
    }
    
    func roundedAndFormattedWithCommas( maxFractionDigit : Int = 0 ) -> String {
        let roundedValue = self.rounded() // Round the double value
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        numberFormatter.maximumFractionDigits = maxFractionDigit // Display no decimal places
        return numberFormatter.string(from: NSNumber(value: roundedValue)) ?? ""
    }
    
    func formattedAsCurrency(locale: Locale = .current) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        //currencyFormatter.locale = locale
        return currencyFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
