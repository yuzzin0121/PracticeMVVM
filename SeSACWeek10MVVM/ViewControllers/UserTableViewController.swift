//
//  UserTableViewController.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/22/24.
//

import UIKit

class UserTableViewController: UITableViewController {
    @IBOutlet weak var removeAllButton: UIBarButtonItem!
    @IBOutlet weak var fetchAllButton: UIBarButtonItem!
    
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    
    let viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        bindData()
    }
    
    func bindData() {
//        viewModel.fetchUser()
        viewModel.list.bind { users in
            self.tableView.reloadData()
        }
    }
    
    func configureView() {
        removeAllButton.target = self
        removeAllButton.action = #selector(removeAllButtonClicked)
        fetchAllButton.target = self
        fetchAllButton.action = #selector(fetchAllButtonClicked)
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }
    
    @objc func  removeAllButtonClicked() {
        viewModel.inputRemoveAllButtonClicked.value = ()
    }
    
    @objc func fetchAllButtonClicked() {
        viewModel.inputFetchButtonClicked.value = ()
        
    }
    
    // 추가 버튼 클릭했을 때
    @objc func addButtonClicked() {
        // viewModel > list > append
        viewModel.inputAddText.value = addTextField.text
        addTextField.text = ""
    }
    
    // 검색 버튼 클릭했을 때
    @objc func searchButtonClicked() {
        viewModel.inputSearchText.value = searchTextField.text
        
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

