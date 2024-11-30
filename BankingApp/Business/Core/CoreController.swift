//
//  CoreController.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 14.11.24.
//

import UIKit

class CoreController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureView()
        configureConstraint()
        configureTargets()
    }
    
    open func configureView() {}
    
    open func configureConstraint() {}
    open func configureTargets() {}

}
