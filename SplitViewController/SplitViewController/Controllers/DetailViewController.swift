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
    }
    
    private func refreshUI() {
        loadViewIfNeeded()
        nameLabel.text = chat?.name
        descriptionLabel.text = chat?.description
        imageView.image = chat?.icon
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
