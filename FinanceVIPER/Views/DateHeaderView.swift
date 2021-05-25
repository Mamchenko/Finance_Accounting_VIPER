//
//  DateHeaderView.swift
//  FinanceVIPER
//
//  Created by Anatoliy Mamchenko on 10.05.2021.
//

import Foundation
import SnapKit
import UIKit

protocol DateHeaderProtocol: class {
    func plusTapped()
}

class DateHeaderView: UIView {
    
    enum UIConstants {
        static let buttonSize: CGFloat = 40
        static let buttonInset: CGFloat = 20
        static let stackInset: CGFloat = 20
    }
    
    var plussButton: UIButton = {
        let button: UIButton = UIButton(type: .system)
        button.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "plusButton"), for: .normal)
        return button
    }()
    
    let deviderView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let deviderTableView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let monthAndYearLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        view.text = "Май 2021"
        return view
    }()
    
    let dayOfTheWeekLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 16)
        view.text = "Среда"
        return view
    }()
    
    let dayLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 50)
        view.text = "5"
        return view
    }()
    
    init(delegate: DateHeaderProtocol) {
        self.delegate = delegate
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: DateHeaderProtocol?
    
    @objc private func plusTapped() {
        delegate?.plusTapped()
    }
    
    func initialize() {
        backgroundColor = .clear
        
        addSubview(deviderTableView)
        deviderTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        addSubview(plussButton)
        plussButton.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.buttonSize)
            make.trailing.top.equalToSuperview().inset(UIConstants.buttonInset)
        }
        
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.addArrangedSubview(dayOfTheWeekLabel)
        verticalStack.addArrangedSubview(monthAndYearLabel)
        
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 5
        horizontalStack.addArrangedSubview(dayLabel)
        horizontalStack.addArrangedSubview(deviderView)
        horizontalStack.addArrangedSubview(verticalStack)
        
        deviderView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(1)
        }
        
        
        addSubview(horizontalStack)
        
        horizontalStack.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(UIConstants.stackInset)
        }
    }
}
