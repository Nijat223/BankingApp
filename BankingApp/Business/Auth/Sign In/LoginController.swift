//
//  LoginController.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 14.11.24.
//

import UIKit
import SwiftUI

class LoginController: CoreController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Please, check your email and password"
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
        image.image = UIImage(named: "Screenshot 2024-11-15 at 07.56.41")
        return image
    }()
    
    private lazy var emailField: UITextField = {
        let email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.delegate = self
        email.translatesAutoresizingMaskIntoConstraints = false
        email.keyboardType = .emailAddress
        return email
    }()
    
    private lazy var passwordField: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.borderStyle = .roundedRect
        password.delegate = self
        password.translatesAutoresizingMaskIntoConstraints = false
        password.keyboardType = .numberPad
        return password
    }()
    
    private lazy var signinButton: UIButton = {
        let signin = UIButton()
        signin.translatesAutoresizingMaskIntoConstraints = false
        signin.setTitle("Sign in", for: .normal)
        signin.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        signin.titleLabel?.textColor = .white
        signin.backgroundColor = .blue
        signin.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        signin.layer.cornerRadius = 12
        return signin
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailField, passwordField])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let viewModel: AuthViewModel
    
    init(viewModel: AuthViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUserList()
        configureViewModel()
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        navigationItem.setHidesBackButton(true, animated: true)
    //        navigationItem.title = "Login"
    //        navigationItem.largeTitleDisplayMode = .always
    //    }
    
    override func configureView() {
        view.addSubview(imageField)
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(signinButton)
        
        configureConstraint()
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
            emailField.heightAnchor.constraint(equalToConstant: 48),
            passwordField.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        
        NSLayoutConstraint.activate([
            signinButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            signinButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            signinButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4),
            signinButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    fileprivate func configureViewModel() {
        viewModel.callback = { [weak self] state in
            guard let self else {return}
            switch state {
            case .loginError(message: let message):
                viewModel.callback = { [weak self] State in
                    switch State{
                    case.error(let message):
                        self?.showMessage(title: message)
                    default: break
                    }
                   
                }
            default: break
            }
            
        }
    }
    
    @objc
    fileprivate func submitClicked() {
        guard let email = emailField.text else {return}
        guard let pass = passwordField.text else {return}
        viewModel.loggedEmail = email
        viewModel.loggedPass = pass
        if viewModel.checkUser() == true {
            let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
            scene?.switchToMain()
        }
    
    }
    
}

    extension LoginController: UITextFieldDelegate {
      
    }

