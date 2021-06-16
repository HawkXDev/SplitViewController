//
//  DetailViewController.swift
//  SplitViewController
//
//  Created by Sergey Sokolkin on 15.06.2021.
//  Copyright © 2021 Siarhei Sakolkin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var chat: Chat? {
        didSet {
            refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func refreshUI() {
        loadViewIfNeeded()
        nameLabel.text = chat?.name
        descriptionLabel.text = chat?.description
        imageView.image = chat?.icon
        tableView.layer.borderColor = chat?.color.uicolor.cgColor
        textField.layer.borderColor = chat?.color.uicolor.cgColor
    }

}

extension DetailViewController: ChatSelectionDelegate {
    func chatSelected(_ newChat: Chat) {
        chat = newChat
    }
}

extension DetailViewController {
    @objc func keyboardWillChangeFrame(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y = -keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
