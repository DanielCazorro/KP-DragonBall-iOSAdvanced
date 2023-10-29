//
//  SceneDelegate.swift
//  KP-DragonBall-iOSAdvanced
//
//  Created by Daniel Cazorro Frías on 23/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let storyboard = UIStoryboard(name: "Splash", bundle: nil)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController
        let secureDataProvider = SecureDataProvider()
        rootViewController?.viewModel = SplashViewModel(
            apiProvider: ApiProvider(),
            secureDataProvider: secureDataProvider
        )
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: rootViewController ?? UIViewController())
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}
