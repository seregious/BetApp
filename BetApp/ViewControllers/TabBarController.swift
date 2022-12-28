//
//  TabBarController.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 23.05.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        
        let bets = DataManager.shared.getBets()
        
        setTabBar()
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = Resources.Colors.tabBar
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let mainImage = UIImage(systemName: "wallet.pass", withConfiguration: boldConfig)
        let statImage = UIImage(systemName: "chart.xyaxis.line", withConfiguration: boldConfig)
        let authorsImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)
        
        tabBar.tintColor = .white
        view.backgroundColor = Resources.Colors.appBackground
        
        
        let mainVC = MainViewController()
        let statVC = StatViewController()
        let authorsVC = AuthorsViewController()
        viewControllers = [
            tabBarItems(for: mainVC, with: "Ставки", with: mainImage),
            tabBarItems(for: statVC, with: "Статистика", with: statImage),
            tabBarItems(for: authorsVC, with: "Авторы", with: authorsImage)
        ]
        
        mainVC.bets = bets
    }
    
    private func tabBarItems(for rootViewController: UIViewController, with title: String, with image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    func setTabBar()  {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
}
