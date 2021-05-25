//
//  ExpensesInteractor.swift
//  viper
//
//  Created by Eduard Mukhametgareev on 02.05.2021.
//

import Foundation

protocol ExpensesInteractorProtocol: class {
    func loadExpenses()
    func loadDate()
}

class ExpensesInteractor: ExpensesInteractorProtocol {
    
    weak var presenter: ExpensesPresenterProtocol?
    private var apiManager: FinanceService = FinanceService.shared
    private var userService: UserService = UserService()
    
    func loadExpenses() {
        apiManager.loadExpenses { [weak self] expenses in
            self?.presenter?.showExpenses(expenses: expenses)
        }
    }
    
    func loadDate() {
        userService.loadDate { [weak self] date in
            self?.presenter?.setDate(date: date)
        }
    }
    
}
