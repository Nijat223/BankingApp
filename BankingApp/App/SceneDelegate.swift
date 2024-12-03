//
//  SceneDelegate.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 09.11.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private var isLogin: Bool = true
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = isLogin ? showMain(scene: windowScene) : showRegister(scene: windowScene)
        window?.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    private func showMain(scene: UIWindowScene) -> UIWindow  {
        let controller = TabBarController()
        let navigationController = UINavigationController(rootViewController: controller)
        let newWindow = UIWindow(windowScene: scene)
        newWindow.rootViewController = navigationController
        return newWindow
    }
    
    private func showRegister(scene: UIWindowScene) -> UIWindow  {
        let controller = RegisterController(viewModel: .init())
        let navigationController = UINavigationController(rootViewController: controller)
        let newWindow = UIWindow(windowScene: scene)
        newWindow.rootViewController = navigationController
        return newWindow
    }
    
    func switchToMain() {
        guard let windowScene = window?.windowScene else {return}
        window = showMain(scene: windowScene)
        window?.makeKeyAndVisible()
    }
    
    func switchToRegister() {
        guard let windowScene = window?.windowScene else {return}
        window = showRegister(scene: windowScene)
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    
}

