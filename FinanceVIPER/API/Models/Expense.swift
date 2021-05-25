//
//  Expense.swift
//  FinanceVIPER
//
//  Created by Anatoliy Mamchenko on 10.05.2021.
//

import Foundation

struct Expense: Decodable {
    //let image: String
    let title: String
    let amount: Double
    let date: String?
}

typealias Expenses = [Expense]
