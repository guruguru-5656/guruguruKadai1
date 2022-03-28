//
//  ViewController.swift
//  challenge_1
//
//  Created by 森本拓未 on 2022/03/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    private var inputTextList: [String] = Array(repeating: "", count: 50)

    @IBOutlet private weak var inputTextTableView: UITableView!
    @IBOutlet private weak var inputTextTableViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextTableView.dataSource = self
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
            inputTextTableViewHeight.constant =
        CGFloat(inputTextList.count * InputLabelCell.cellHeight)
    }

    @IBAction private func calculateSum(_ sender: Any) {
        let resultNumber = inputTextList
            .compactMap { Int($0) }
            .reduce(0, +)
        resultLabel.text = String(resultNumber)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        inputTextList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InputLabelCell", for: indexPath)
                as? InputLabelCell else {
            return UITableViewCell()
        }

        cell.configure(
            text: inputTextList[indexPath.row],
            didUpdateText: { [weak self] in
                self?.inputTextList[indexPath.row] = $0
            }
        )

        return cell
    }
}
