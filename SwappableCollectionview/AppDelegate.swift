//
//  AppDelegate.swift
//  SwappableCollectionview
//
//  Created by Akshatha on 16/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navController: UINavigationController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let launchViewController = storyBoard.instantiateViewController(
            withIdentifier: "SwappableViewController")
        let navigationController = UINavigationController(rootViewController: launchViewController)
        navController = navigationController
        navController?.isNavigationBarHidden = true
        self.window?.rootViewController = navController
        return true
    }


}

