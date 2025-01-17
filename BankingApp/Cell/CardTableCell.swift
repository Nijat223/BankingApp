//
//  CardTableCell.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 03.12.24.
//

import UIKit

class CardTableCell: UITableViewCell {
    
    lazy var greenView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue.withAlphaComponent(0.2)
        v.layer.cornerRadius = 10
        v.layer.borderColor = UIColor.blue.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
        lazy var cardNumber: ReusableLabel = {
          let l = ReusableLabel(title: "number", size: 12)
            l.font = UIFont.systemFont(ofSize: 14)
            l.translatesAutoresizingMaskIntoConstraints = false
            l.layer.cornerRadius = 10
            l.backgroundColor = .clear
            return l
        }()
    
    
        lazy var cardBalance: ReusableLabel = {
            let l = ReusableLabel(title: "balance", size: 12)
            l.font = UIFont.systemFont(ofSize: 14)
            l.translatesAutoresizingMaskIntoConstraints = false
            l.backgroundColor = .clear
            return l
        }()
    
    lazy var cardType: ReusableImageView = {
        let i = ReusableImageView(imageName: "master", contentMode: .scaleAspectFill, cornerRadius: 10)
        
        return i
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
        
    }
    
        private func configureUI() {
            contentView.addViews(view: [cardNumber, greenView, cardType, cardBalance])
        }
    
        private func configureConstraints() {
            NSLayoutConstraint.activate([
                greenView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
                greenView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
                greenView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
                greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
    
                cardType.centerYAnchor.constraint(equalTo: greenView.centerYAnchor),
                cardType.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 20),
                cardType.trailingAnchor.constraint(equalTo: cardNumber.leadingAnchor, constant: -20),
                cardType.heightAnchor.constraint(equalToConstant: 40),
                cardType.widthAnchor.constraint(equalToConstant: 40),
    
                cardNumber.centerYAnchor.constraint(equalTo: greenView.centerYAnchor),
                cardNumber.leadingAnchor.constraint(equalTo: cardType.trailingAnchor, constant: 20),
                cardNumber.trailingAnchor.constraint(equalTo: cardBalance.leadingAnchor, constant: -10),
                cardNumber.heightAnchor.constraint(equalToConstant: 30),
    
                cardBalance.centerYAnchor.constraint(equalTo: greenView.centerYAnchor),
                cardBalance.leadingAnchor.constraint(equalTo: cardNumber.trailingAnchor, constant: 10),
                cardBalance.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -20),
                cardBalance.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    }
    
