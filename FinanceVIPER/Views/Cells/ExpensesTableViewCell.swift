//
//  ExpensesTableViewCell.swift
//  FinanceVIPER
//
//  Created by Anatoliy Mamchenko on 21.05.2021.
//

import SnapKit
import UIKit

class ExpensesTableViewCell: UITableViewCell {
    
    enum UIConstants {
        static let imageSize: CGFloat = 10
    }
    
    let expensesImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "pencil")
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = UIConstants.imageSize / 2
        return view
    }()
    
    let expenseNameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 7)
        return view
    }()
    
    lazy var expenseDateLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 3)
        return view
    }()
    
    lazy var expenseSummaryLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 7)
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.addArrangedSubview(expenseNameLabel)
        verticalStack.addArrangedSubview(expenseDateLabel)
        
        contentView.addSubview(verticalStack)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(expense: Expense) {
        
    }

}
