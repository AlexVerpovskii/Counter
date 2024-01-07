//
//  Constants.swift
//  Counter
//
//  Created by Александр Верповский on 07.01.2024.
//

import Foundation

enum Constants {
    enum Action: String {
        case plus = "+1"
        case minus = "-1"
    }
    enum TimeFormat: String {
        case fullDate = "YY, MMM d, HH:mm:ss"
    }
    enum StringsConstants: String {
        case startHistoryLabel = "История изменений:\n"
    }
}
