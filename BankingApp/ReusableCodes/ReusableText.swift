//
//  ReusableText.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 30.11.24.
//

import UIKit
class ReusableText: UITextField, UITextFieldDelegate {
    private var title: String
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI() {
       layer.borderWidth = 1.0
       layer.borderColor = UIColor.lightGray.cgColor
       placeholder = title
       setLeftPadding(8)
       textColor = .black
       delegate = self
       layer.cornerRadius = 12
    }
}
