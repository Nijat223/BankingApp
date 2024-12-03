//
//  ReusableButton.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 30.11.24.
//

import UIKit
class ReusableButton: UIButton {
    private var title:String
    private var action : ()->Void
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI() {
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        titleLabel?.textColor = .white
        backgroundColor = .black
        addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        layer.cornerRadius = 12
    }
    @objc private func buttonClicked() {
        action()
    }
}

