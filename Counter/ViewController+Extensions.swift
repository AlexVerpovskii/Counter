//
//  ViewController+Extensions.swift
//  Counter
//
//  Created by Александр Верповский on 07.01.2024.
//

import UIKit

extension ViewController {
    
    func setupUI() {
        setUpHistoryTV()
        setUpCountLabel()
        setupButtonOutlet(button: trashButtonOutlet, imageName: "trash")
        setupButtonOutlet(button: plusButtonOutlet, imageName: "plus")
        setupButtonOutlet(button: minusButtonOutlet, imageName: "minus")
    }
    
    private func setupButtonOutlet(button: UIButton, imageName: String) {
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.tintColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
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
    }
    
    private func setUpCountLabel() {
        countLabel.font = UIFont.systemFont(ofSize: 20)
        countLabel.text = "0"
        countLabel.textAlignment = .center
    }
}
