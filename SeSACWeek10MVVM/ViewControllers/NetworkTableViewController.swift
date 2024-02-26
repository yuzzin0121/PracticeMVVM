//
//  NetworkTableViewController.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/26/24.
//

import UIKit

class NetworkTableViewController: UITableViewController {
    @IBOutlet weak var tempLabel: UILabel!
    
    let viewModel = NetworkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        viewModel.inputViewDidLoadTrigger.value = ()
        bindData()
    }
    
    func bindData() {
        viewModel.outputMarketData.bind { markets in
            self.tableView.reloadData()
        }
        viewModel.outputLabelData.bind { value in
            self.tempLabel.text = value
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "networkCell")!
        let data = viewModel.cellForRowAt(indexPath)
        cell.textLabel?.text = data.korean_name
        cell.detailTextLabel?.text = data.market
        return cell
    }
}
