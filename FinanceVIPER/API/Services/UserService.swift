//
//  UserService.swift
//  FinanceVIPER
//
//  Created by Anatoliy Mamchenko on 10.05.2021.
//

import Foundation

class UserService {
    
    func loadDate (completion: @escaping (Date) -> ()) {
        let todayDate = Date()
        completion(todayDate)
    }
}
