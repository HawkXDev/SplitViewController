//
//  MasterViewController.swift
//  SplitViewController
//
//  Created by Sergey Sokolkin on 15.06.2021.
//  Copyright © 2021 Siarhei Sakolkin. All rights reserved.
//

import UIKit

protocol ChatSelectionDelegate: class {
    func chatSelected(_ newChat: Chat)
}

class MasterViewController: UITableViewController {
    
    weak var delegate: ChatSelectionDelegate?
    
    let chatsBrain = ChatsBrain()
    
    let reuseIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table View Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatsBrain.chats.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let chat = chatsBrain.chats[indexPath.row]
        cell.textLabel?.text = chat.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedChat = chatsBrain.chats[indexPath.row]
        delegate?.chatSelected(selectedChat)
        if let detailViewController = delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }

}
