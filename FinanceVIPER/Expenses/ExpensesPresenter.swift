//
//  ExpensesPresenter.swift
//  viper
//
//  Created by Eduard Mukhametgareev on 02.05.2021.
//

import Foundation

protocol ExpensesPresenterProtocol: class {
    func viewDidLoaded()
    func showExpenses (expenses: Expenses)
    func setDate (date: Date)
    
}

class ExpensesPresenter: ExpensesPresenterProtocol {

    weak var view: ExpensesViewProtocol?
    let interactor: ExpensesInteractorProtocol

    init(interactor: ExpensesInteractorProtocol) {
        self.interactor = interactor
    }
    
    func viewDidLoaded() {
        interactor.loadExpenses()
        interactor.loadExpenses()
    }
    
    func showExpenses(expenses: Expenses) {
        view?.showExpenses(expenses: expenses)
    }
    
    func setDate(date: Date) {
        view?.setDate(date: date)
    }
    
}
