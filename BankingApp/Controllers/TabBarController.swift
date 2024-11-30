//
//  TabBarController.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 26.11.24.
//


import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
    super.viewDidLoad()
    configureTabBar()
}

private func configureTabBar() {
    let firstCont = MainController(viewModel: AuthViewModel())
        let secondCont = TransferController()
        firstCont.tabBarItem = UITabBarItem(title: "Home", image: UIImage (systemName: "house.fill"), tag: 0)
        secondCont.tabBarItem = UITabBarItem(title: "More", image: UIImage (systemName: "ellipsis.circle"), tag: 0)
        viewControllers = [firstCont, secondCont]
    }
    
}
