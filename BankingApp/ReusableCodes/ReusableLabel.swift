//
//  ReusableLabel.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 30.11.24.
//

import UIKit
final class ReusableLabel: UILabel {
    private var title: String
    private var size: CGFloat
    init(title: String,size:CGFloat) {
        self.size = size
        self.title = title
        super.init(frame: .zero)
        ConfigureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func ConfigureUI() {
        text = title
        textAlignment = .center
        numberOfLines = 0
        setLeftPaddingForLabel(2)
        font = UIFont.systemFont(ofSize: size, weight: .heavy)
        textColor = .black
    }
}
