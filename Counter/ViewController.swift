//
//  ViewController.swift
//  Counter
//
//  Created by Александр Верповский on 07.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    /*
     Оформление и структурирование классов в Swift
     Нашел статью на хабре (https://habr.com/ru/articles/744470/)
     Но там ничего не написано по поводу статичных свойств
     Вопрос: а по правилу хорошего тона, где обычно создаются (место в коде)?
     или так вообще не принято?
     */
//    private static var TIME_FORMAT: String = "YY, MMM d, HH:mm:ss"
    
    typealias Action = Constants.Action
    typealias Format = Constants.TimeFormat
    typealias StringsConstants = Constants.StringsConstants

    // MARK: - IB Outlets
    @IBOutlet weak var trashButtonOutlet: UIButton!
    @IBOutlet weak var historyTV: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var minusButtonOutlet: UIButton!
    
    // MARK: - Private Properties
    private var count: Int = 0
    let stringIndex = StringsConstants.startHistoryLabel.rawValue.endIndex
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        setupUI()
    }

    // MARK: - IB Actions
    @IBAction private func trachButtonAction(_ sender: UIButton) {
        clearHistory()
    }
    @IBAction private func plusButtonAction(_ sender: UIButton) {
        addHistoryEntity(action: .plus)
    }
    @IBAction private func minusButtonAction(_ sender: UIButton) {
        addHistoryEntity(action: .minus)
    }
    
    // MARK: - Private Methods
    private func addHistoryEntity(action: Action) {
        switch action {
        case .plus:
            //Есть решение получше с добавлением в начало строки?
            historyTV.text.insert(contentsOf: "[\(timeToStringConverter())]: \(Action.plus.rawValue)\n", at: stringIndex)
            count += 1
        case .minus:
            if count > 0 {
                historyTV.text.insert(contentsOf: "[\(timeToStringConverter())]: \(Action.minus.rawValue)\n", at: stringIndex)
                count -= 1
            } else {
                historyTV.text.insert(contentsOf: "[\(timeToStringConverter())]: попытка уменьшить значение счётчика ниже 0\n", at: stringIndex)
            }
        }
        countLabel.text = String(count)
    }
    
    private func timeToStringConverter() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Format.fullDate.rawValue
        return dateFormatter.string(from: date)
    }
    
    private func clearHistory() {
        historyTV.text.insert(contentsOf: "[\(timeToStringConverter())]: значение сброшено\n", at: stringIndex)
        count = 0
        countLabel.text = String(count)
    }
}

