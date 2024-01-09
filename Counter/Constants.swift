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
        case errorLessThanZero = "попытка уменьшить значение счётчика ниже 0\n"
        case resetValue = "значение сброшено\n"
    }
    enum LocalDateFormat: String {
        case ru = "ru_RU"
    }
    enum ImageName: String {
        case trash = "trash"
        case plus = "plus"
        case minus = "minus"
    }
    enum Number: String {
        case zero = "0"
    }
    enum OtherString: String {
        case empty = ""
    }
}
