//
//  ExpensesModuleBuilder.swift
//  viper
//
//  Created by Eduard Mukhametgareev on 02.05.2021.
//

import Foundation

class ExpensesModuleBuilder {

    static func build() -> ExpensesViewController {
        let interactor = ExpensesInteractor()
        let presenter = ExpensesPresenter(interactor: interactor)
        let controller = ExpensesViewController(presenter: presenter)
        presenter.view = controller
        interactor.presenter = presenter
        return controller
    }

}
