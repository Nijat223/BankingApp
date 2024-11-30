//
//  RegisterController.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 09.11.24.
//

import UIKit
import SwiftUI
import RealmSwift
class RegisterController: CoreController {
    
    
    private var viewModel = AuthViewModel()
        
        init(viewModel: AuthViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
       

    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Welcome, Banking app"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageField: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "Screenshot 2024-11-15 at 07.50.48")
        return image
    }()
    
    private lazy var surnameField: UITextField = {
       let surname = UITextField()
        surname.placeholder = "Surname"
        surname.borderStyle = .roundedRect
        surname.delegate = self
        surname.backgroundColor = .white.withAlphaComponent(0.5)
        surname.translatesAutoresizingMaskIntoConstraints = false
        return surname
    }()
    
    
    private lazy var nameField: UITextField = {
       let name = UITextField()
        name.placeholder = "Name"
        name.borderStyle = .roundedRect
        name.delegate = self
        name.backgroundColor = .white.withAlphaComponent(0.5)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var emailField: UITextField = {
       let email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.delegate = self
        email.backgroundColor = .white.withAlphaComponent(0.5)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.keyboardType = .emailAddress
        return email
    }()
    
    private lazy var passwordField: UITextField = {
       let password = UITextField()
        password.placeholder = "Password"
        password.borderStyle = .roundedRect
        password.delegate = self
        password.backgroundColor = .white.withAlphaComponent(0.5)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.keyboardType = .numberPad
        return password
    }()
    
    private lazy var signupButton: UIButton = {
        let signup = UIButton()
        signup.translatesAutoresizingMaskIntoConstraints = false
        signup.setTitle("Sign up", for: .normal)
        signup.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        signup.titleLabel?.textColor = .white
        signup.backgroundColor = .blue
        signup.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        signup.layer.cornerRadius = 12
        return signup
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [surnameField, nameField,emailField, passwordField])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        print("Realm is located at:", realm.configuration.fileURL!)

    }
    
    override func configureView() {
        view.addSubview(imageField)
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(signupButton)

        configureConstraint()
        viewListener()
    }
    
    override func configureConstraint() {
        
        NSLayoutConstraint.activate([
            imageField.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            imageField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            imageField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            surnameField.heightAnchor.constraint(equalToConstant: 48),
            emailField.heightAnchor.constraint(equalToConstant: 48),
            passwordField.heightAnchor.constraint(equalToConstant: 48),
            nameField.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        
        NSLayoutConstraint.activate([
            signupButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            signupButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            signupButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4),
            signupButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    fileprivate func viewListener() {
        viewModel.callback = { [weak self] State in
            switch State{
            case.error(let message):
                self?.showMessage(title: message)
            default: break
            }
           
        }
    }
    
    @objc
    fileprivate func submitClicked() {
        viewModel.checkValidation()
        let vc = LoginController(viewModel: viewModel.self)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension RegisterController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let surname = surnameField.text else {return}
        guard let name = nameField.text else {return}
        guard let email = emailField.text else {return}
        guard let password = passwordField.text else {return}
        viewModel.name = name
        viewModel.surname = surname
        viewModel.email = email
        viewModel.password = password
    }
}
