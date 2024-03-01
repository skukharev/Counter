//
//  Date+Extensions.swift
//  Counter
//
//  Created by Сергей Кухарев on 25.02.2024.
//

import Foundation

extension Date {
    var dateTimeString: String { DateFormatter.defaultDateTime.string(from: self) }
}

private extension DateFormatter {
    static let defaultDateTime: DateFormatter = {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "dd.MM.YY hh:mm:ss";
        return dateFormatter;
    }()
}
