//
//  Int+Extensions.swift
//  Counter
//
//  Created by Сергей Кухарев on 25.02.2024.
//

import Foundation;

extension Int {
    var intToString: String {
        var numValue: NSNumber = (self as NSNumber);
        return NumberFormatter.defaultInt.string(from: numValue)!;
    }
}

private extension NumberFormatter {
    static let defaultInt: NumberFormatter = {
        let intFormatter = NumberFormatter();
        intFormatter.numberStyle = .decimal;
        intFormatter.groupingSeparator = " ";
        intFormatter.locale = Locale.current;
        return intFormatter;
    } ();
}
