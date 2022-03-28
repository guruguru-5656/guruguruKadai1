//
//  InputLabelCell.swift
//  challenge_1
//
//  Created by 森本拓未 on 2022/03/24.
//

import Foundation
import UIKit

class InputLabelCell: UITableViewCell, UITextFieldDelegate {
    static let cellHeight = 45

    private var didUpdateText: (String) -> Void = { _ in }

    @IBOutlet private weak var textField: UITextField!

    @IBAction private func updateTextWhenEditingChanged(_ sender: UITextField) {
        didUpdateText(sender.text ?? "")
    }

    func configure(text: String, didUpdateText: @escaping (String) -> Void) {
        self.textField.text = text
        self.didUpdateText = didUpdateText
    }
}
