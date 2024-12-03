//
//  CardTable.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 02.12.24.
//

import UIKit

class CardTable: UITableViewCell {
        
        lazy var greenView: UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = .green.withAlphaComponent(0.2)
            v.layer.cornerRadius = 10
            v.layer.borderColor = UIColor.green.cgColor
            v.layer.borderWidth = 1
            return v
        }()
        
        lazy var cardNumber: ReusableLabel = {
            let l = ReusableLabel(title: "Pan", size: 12)
            l.font = UIFont.systemFont(ofSize: 14)
            
            l.layer.cornerRadius = 10
            l.backgroundColor = .clear
            return l
        }()
        
        
        lazy var cardBalance: ReusableLabel = {
            let l = ReusableLabel(title: "Balance", size: 12)
            l.font = UIFont.systemFont(ofSize: 14)
            l.backgroundColor = .clear
            return l
        }()

        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            
        }
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            backgroundColor = .clear
            configureUI()
            configureConstraints()
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
        private func configureUI() {
            contentView.addViews(view: [cardNumber, greenView, cardBalance])
        }
        
        private func configureConstraints() {
            NSLayoutConstraint.activate([
                greenView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
                greenView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
                greenView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
                greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            
                cardNumber.centerYAnchor.constraint(equalTo: greenView.centerYAnchor),
                cardNumber.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
                cardNumber.heightAnchor.constraint(equalToConstant: 30),
                cardNumber.widthAnchor.constraint(equalToConstant: 70),
                
                cardBalance.centerYAnchor.constraint(equalTo: greenView.centerYAnchor),
                cardBalance.leadingAnchor.constraint(equalTo: cardNumber.trailingAnchor, constant: 10),
                cardBalance.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -20),
                cardBalance.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    }
