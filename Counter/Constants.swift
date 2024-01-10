//
//  Constants.swift
//  Counter
//
//  Created by Александр Верповский on 07.01.2024.
//

import Foundation

enum Constants {
    enum Action: String {
        case plusOne = "+1"
        case minusOne = "-1"
    }
    enum TimeFormat: String {
        case fullDate = "YY, MMM d, HH:mm:ss"
    }
    enum StringsConstants: String {
        case startHistoryLabel = "История изменений:\n"
        case errorLessThanZero = "попытка уменьшить значение счётчика ниже 0\n"
        case resetValue = "значение сброшено\n"
    }
    enum LocalDateFormat: String {
        case russian = "ru_RU"
    }
    enum ImageName: String {
        case trash
        case plus
        case minus
    }
    enum Number: String {
        case zero = "0"
    }
    enum OtherString: String {
        case empty = ""
    }
}
