//
//  ProfileController.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 03.12.24.
//

import UIKit

class ProfileController: CoreController {
    
    
    private lazy var logoutImage: ReusableImageView = {
        let i = ReusableImageView(imageName: "16600462253477164630_1200x630", contentMode: .scaleAspectFill, cornerRadius: 20)
        return i
    }()
    
    private lazy var nameLabel: ReusableLabel = {
        let l = ReusableLabel(title: "Name", size: 12)
        l.translatesAutoresizingMaskIntoConstraints = false

        l.backgroundColor = .white.withAlphaComponent(0.2)
        return l
    }()
    
    private lazy var lastNameLabel: ReusableLabel = {
        let l = ReusableLabel(title: "Surname", size: 12)
        l.backgroundColor = .white.withAlphaComponent(0.2)
        l.translatesAutoresizingMaskIntoConstraints = false

        return l
    }()
    
    
    private lazy var emailLabel: ReusableLabel = {
        let l = ReusableLabel(title: "Email", size: 12)
        l.backgroundColor = .white.withAlphaComponent(0.2)
        l.translatesAutoresizingMaskIntoConstraints = false

        return l
    }()
    
    private lazy var logOutButton: ReusableButton = {
        let b = ReusableButton(title: "Log Out", action: {[weak self] in self?.logOutAction()})
        b.translatesAutoresizingMaskIntoConstraints = false

        b.backgroundColor = .black
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let email = UserDefaults.standard.string(forKey: "email") {
               emailLabel.text = "  Email: " + email
           }
        if let name = UserDefaults.standard.string(forKey: "firstName") {
               nameLabel.text = "  Name: " + name
           }
    
        if let lastname = UserDefaults.standard.string(forKey: "lastName") {
               lastNameLabel.text = "  Lastname: " + lastname
           }
                
    }
    
    @objc func logOutAction() {
        logoutAlert(message: "Click yes to logout")
    }
    
    
    func logoutAlert(message: String) {
        let alert = UIAlertController(title: "Do you want to log out?", message: message, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Log out", style: .default) { _ in
            if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                scene.switchToRegister()
            }
            UserDefaults.standard.removeObject(forKey: "lastName")
            UserDefaults.standard.removeObject(forKey: "email")
            UserDefaults.standard.removeObject(forKey: "firstName")
            UserDefaults.standard.removeObject(forKey: "phone")
        }
        yesAction.setValue(UIColor.blue, forKey: "titleTextColor")
        let noAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
        }
                alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func configureView() {
        super.configureView()
        view.addViews(view: [logOutButton, logoutImage, nameLabel, lastNameLabel, emailLabel])
    }
    
 
    override func configureConstraint() {
        super.configureConstraint()
        
        NSLayoutConstraint.activate([
            logOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            logOutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            logOutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            logOutButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            logoutImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            logoutImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutImage.heightAnchor.constraint(equalToConstant: 180),
            logoutImage.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: logoutImage.bottomAnchor, constant: 48),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            nameLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24),
            lastNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            lastNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            lastNameLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
    
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 24),
            emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            emailLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            emailLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
}
