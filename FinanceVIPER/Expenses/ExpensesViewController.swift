//
//  ExpensesViewController.swift
//  viper
//
//  Created by Eduard Mukhametgareev on 02.05.2021.
//

import Foundation
import SnapKit
import UIKit

protocol ExpensesViewProtocol: AnyObject {
    func showExpenses(expenses: Expenses)
    func setDate(date: Date)
}

class ExpensesViewController: UIViewController, ExpensesViewProtocol, DateHeaderProtocol {
    
    enum UIConstants {
        static let headerTopInset: CGFloat = 30
        static let cellIdentifier: String = "ExpensesCell"
    }
    
    private var expenses: Expenses = []
    
    private var expensesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(ExpensesTableViewCell.self, forCellReuseIdentifier: UIConstants.cellIdentifier)
        return tableView
    }()
    
    
    let presenter: ExpensesPresenterProtocol
    init(presenter: ExpensesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("don't use storyboards!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoaded()
        initialize()
    }
    
    private func initialize() {
        
        expensesTableView.delegate = self
        expensesTableView.dataSource = self
        
        view.backgroundColor = UIColor(red: 37/255, green: 64/255, blue: 77/255, alpha: 1)
        let headerView = DateHeaderView(delegate: self)
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(UIConstants.headerTopInset)
            make.height.equalTo(self.view).multipliedBy(0.1)
        }
    }
    
    func plusTapped() {
        print("plusTapped")
    }
    
    func showExpenses(expenses: Expenses) {
    }
    
    func setDate(date: Date) {
        
    }
    
}

extension ExpensesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UIConstants.cellIdentifier) as! ExpensesTableViewCell
        cell.configure(expense: expenses[indexPath.row])
        return cell
    }
    
    
}
