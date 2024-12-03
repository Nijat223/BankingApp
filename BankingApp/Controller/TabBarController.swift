//
//  TabBarController.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 02.12.24.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
    super.viewDidLoad()
    configureTabBar()
}

private func configureTabBar() {
    self.tabBar.tintColor = .black
    self.tabBar.unselectedItemTintColor = .gray
    let firstCont = MainController(viewModel: MainViewModel())
    let secondCont = ProfileController()
        firstCont.tabBarItem = UITabBarItem(title: "Home", image: UIImage (systemName: "house.fill"), tag: 0)
        secondCont.tabBarItem = UITabBarItem(title: "Profile", image: UIImage (systemName: "person.crop.circle"), tag: 0)
        viewControllers = [firstCont, secondCont]
    }
    
}
