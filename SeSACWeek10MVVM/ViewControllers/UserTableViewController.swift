//
//  UserTableViewController.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/22/24.
//

import UIKit

class UserTableViewController: UITableViewController {
    let viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let row = viewModel.cellForRowAt(indexPath)
        cell.textLabel?.text = row.name
        return cell
    }
}

