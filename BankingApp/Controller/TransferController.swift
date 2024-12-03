//
//  TransferController.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 02.12.24.
//

import UIKit

class TransferController: CoreController {
    
    private var viewModel : TransferViewModel
    
    init(viewModel: TransferViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var selectFromLabel: ReusableLabel = {
        let l = ReusableLabel(title: "Select From", size: 18)
        l.backgroundColor = .white.withAlphaComponent(0.5)
        l.layer.cornerRadius = 6
        l.clipsToBounds = true
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var selectToLabel: ReusableLabel = {
        let l = ReusableLabel(title: "Select To", size: 18)
        l.backgroundColor = .white.withAlphaComponent(0.5)
        l.layer.cornerRadius = 6
        l.clipsToBounds = true
        l.textAlignment = .left
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private lazy var amountText: ReusableText = {
        let t = ReusableText(title: "")
        t.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        t.textAlignment = .left
        t.layer.borderColor = UIColor.clear.cgColor
        t.backgroundColor = .white.withAlphaComponent(0.5)
        t.layer.cornerRadius = 6
        t.clipsToBounds = true
        t.text = "Amount"
        t.keyboardType = .numberPad
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    private lazy var selectFromContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 12
        container.addSubview(selectFromLabel)
        container.addSubview(downFromSelect)
         
        NSLayoutConstraint.activate([
            selectFromLabel.topAnchor.constraint(equalTo: container.topAnchor),
            selectFromLabel.leftAnchor.constraint(equalTo: container.leftAnchor),
            selectFromLabel.rightAnchor.constraint(equalTo: container.rightAnchor),
            selectFromLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            downFromSelect.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            downFromSelect.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            downFromSelect.widthAnchor.constraint(equalToConstant: 24),
            downFromSelect.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        return container
    }()
    private lazy var selectToContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 12
        container.addSubview(selectToLabel)
        container.addSubview(downToSelect)
        
        NSLayoutConstraint.activate([
            selectToLabel.topAnchor.constraint(equalTo: container.topAnchor),
            selectToLabel.leftAnchor.constraint(equalTo: container.leftAnchor),
            selectToLabel.rightAnchor.constraint(equalTo: container.rightAnchor),
            selectToLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            downToSelect.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            downToSelect.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            downToSelect.widthAnchor.constraint(equalToConstant: 24),
            downToSelect.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        return container
    }()
    private lazy var downFromSelect: UIButton = {
        let b = UIButton(type: .custom)
        b.setImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        b.tintColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(downFromClicked), for: .touchUpInside)
        return b
    }()
    private lazy var downToSelect: UIButton = {
        let b = UIButton(type: .custom)
        b.setImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        b.tintColor = .white
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(downToClicked), for: .touchUpInside)
        return b
    }()
    private lazy var transferButton: ReusableButton = {
        let b = ReusableButton(title: "Transfer") {
            [weak self] in self?.transferClicked()
        }
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        amountText.delegate = self
    }
    override func configureView() {
        super.configureView()
        view.addViews(view: [selectToContainer,selectFromContainer, amountText,transferButton])
        amountText.delegate = self
    }
    override func configureConstraint() {
        super.configureConstraint()
        NSLayoutConstraint.activate([
            selectFromContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 138),
            selectFromContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            selectFromContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            selectFromContainer.heightAnchor.constraint(equalToConstant: 58)
        ])
        NSLayoutConstraint.activate([
            selectToContainer.topAnchor.constraint(equalTo: selectFromContainer.bottomAnchor, constant: 48),
            selectToContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            selectToContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            selectToContainer.heightAnchor.constraint(equalToConstant: 58)
        ])
        NSLayoutConstraint.activate([
            amountText.topAnchor.constraint(equalTo: selectToContainer.bottomAnchor, constant: 48),
            amountText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            amountText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            amountText.heightAnchor.constraint(equalToConstant: 58)
        ])
        NSLayoutConstraint.activate([
            transferButton.topAnchor.constraint(equalTo: amountText.bottomAnchor, constant: 48),
            transferButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48),
            transferButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -48),
            transferButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
    }
    @objc fileprivate func transferClicked() {
        viewModel.amount = Int(String( amountText.text ?? "")) ?? 0
        viewModel.transfer()
    }
    @objc fileprivate func downFromClicked() {
        let listController = CardListController(viewModel:TransferViewModel())
        listController.isFrom = true
        listController.modalPresentationStyle = .pageSheet
        if let sheet = listController.sheetPresentationController {
            sheet.detents = [.medium(),.large()]
            sheet.prefersGrabberVisible = true
        }
        present(listController, animated: true)
    }
    @objc fileprivate func downToClicked() {
        let listController = CardListController(viewModel:TransferViewModel())
        listController.isFrom = false
        listController.modalPresentationStyle = .pageSheet
        if let sheet = listController.sheetPresentationController {
            sheet.detents = [.medium(),.large()]
            sheet.prefersGrabberVisible = true
        }
        present(listController, animated: true)
    }

}
extension TransferController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
          if textField.text == "Amount" {
              textField.text = ""
          }
      }

      func textFieldDidEndEditing(_ textField: UITextField) {
          if textField.text?.isEmpty ?? true {
              textField.text = "Amount"
          }
      }
}
