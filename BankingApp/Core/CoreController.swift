//
//  CoreController.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 02.12.24.
//

import UIKit

class CoreController: UIViewController {

    private lazy var imageBG: UIImageView = {
            let i = UIImageView()
            i.clipsToBounds = true
            i.image = UIImage(named: "particle_background")
            i.contentMode = .scaleAspectFill
            i.translatesAutoresizingMaskIntoConstraints = false
  return i}()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureView()
        configureConstraint()
        configureTargets()
    }
    
    open func configureView() {
        view.addSubview(imageBG)
    }
    
    open func configureConstraint() {
        NSLayoutConstraint.activate([
            imageBG.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageBG.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            imageBG.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            imageBG.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    open func configureTargets() {}

}
