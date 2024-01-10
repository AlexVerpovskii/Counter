//
//  ViewController.swift
//  Counter
//
//  Created by Александр Верповский on 07.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Type alias
    private typealias Action = Constants.Action
    private typealias Format = Constants.TimeFormat
    private typealias StringsConstants = Constants.StringsConstants
    
    // MARK: - IB Outlets
    @IBOutlet private weak var trashButtonOutlet: UIButton!
    @IBOutlet private weak var historyTV: UITextView!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var plusButtonOutlet: UIButton!
    @IBOutlet private weak var minusButtonOutlet: UIButton!
    
    // MARK: - Private Properties
    private var count: Int = 0
    private let stringIndex = StringsConstants.startHistoryLabel.rawValue.endIndex
    
    // MARK: - View Life Cycles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    // MARK: - IB Actions
    @IBAction private func trashButtonAction(_ sender: UIButton) {
        clearHistory()
    }
    
    @IBAction private func plusButtonAction(_ sender: UIButton) {
        addHistoryEntity(action: .plusOne)
    }
    
    @IBAction private func minusButtonAction(_ sender: UIButton) {
        addHistoryEntity(action: .minusOne)
    }
    
    // MARK: - Private Methods
    private func addHistoryEntity(action: Action) {
        switch action {
        case .plusOne:
            // Есть решение получше с добавлением в начало строки?
            historyTV.text.insert(contentsOf: "[\(timeToStringConverter())]: \(Action.plusOne.rawValue)\n", at: stringIndex)
            count += 1
        case .minusOne:
            if count > 0 {
                historyTV.text.insert(contentsOf: "[\(timeToStringConverter())]: \(Action.minusOne.rawValue)\n", at: stringIndex)
                count -= 1
            } else {
                historyTV.text.insert(contentsOf: "[\(timeToStringConverter())]: \(StringsConstants.errorLessThanZero.rawValue)", at: stringIndex)
            }
        }
        countLabel.text = String(count)
    }
    
    private func timeToStringConverter() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Constants.LocalDateFormat.russian.rawValue)
        dateFormatter.dateFormat = Format.fullDate.rawValue
        return dateFormatter.string(from: date)
    }
    
    private func clearHistory() {
        historyTV.text.insert(contentsOf: "[\(timeToStringConverter())]: \(StringsConstants.resetValue.rawValue)", at: stringIndex)
        count = 0
        countLabel.text = String(count)
    }
}

extension ViewController {
    
    private func setupUI() {
        setUpHistoryTV()
        setUpCountLabel()
        setupButtonOutlet(button: trashButtonOutlet, imageName: Constants.ImageName.trash.rawValue)
        setupButtonOutlet(button: plusButtonOutlet, imageName: Constants.ImageName.plus.rawValue)
        setupButtonOutlet(button: minusButtonOutlet, imageName: Constants.ImageName.minus.rawValue)
    }
    
    private func setupButtonOutlet(button: UIButton, imageName: String) {
        button.setTitle(Constants.OtherString.empty.rawValue, for: .normal)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.tintColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = button.bounds.height / 2
        switch button {
        case plusButtonOutlet:
            button.backgroundColor = .systemRed
        case minusButtonOutlet:
            button.backgroundColor = .systemBlue
        default:
            break
        }
    }
    
    private func setUpHistoryTV() {
        historyTV.text = StringsConstants.startHistoryLabel.rawValue
        historyTV.isEditable = false
        historyTV.textAlignment = .center
        historyTV.font = UIFont.systemFont(ofSize: 18)
        historyTV.layer.borderWidth = 1.0
        historyTV.layer.cornerRadius = 10
        historyTV.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setUpCountLabel() {
        countLabel.font = UIFont.systemFont(ofSize: 20)
        countLabel.text = Constants.Number.zero.rawValue
        countLabel.textAlignment = .center
    }
}
