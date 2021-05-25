//
//  FinanceService.swift
//  FinanceVIPER
//
//  Created by Anatoliy Mamchenko on 10.05.2021.
//

import Foundation

class FinanceService {
    
   static var shared: FinanceService = FinanceService()
    
    let expensesMock: Expenses = [Expense(title: "bread", amount: 100, bank: "Tinkoff"), Expense(title: "bread", amount: 100, bank: "Tinkoff"), Expense(title: "bread", amount: 100, bank: nil)]
    
    private init () {}
    
    func loadExpenses(completion: @escaping ((Expenses) -> (Void)) ) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            completion(self.expensesMock)
        }
    }
}
