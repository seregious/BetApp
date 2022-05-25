//
//  TabBarController.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 23.05.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    let bets = DataManager.shared.betDataBase
    
    
    override func viewDidLoad() {
        
        setTabBar()
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .appRed
            UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        //gradientBackground()
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let mainImage = UIImage(systemName: "wallet.pass", withConfiguration: boldConfig)
        let statImage = UIImage(systemName: "chart.xyaxis.line", withConfiguration: boldConfig)
        let authorsImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)
        
        tabBar.tintColor = .white
        //tabBar.barTintColor = .black.withAlphaComponent(0.1)
        view.backgroundColor = .appBlue
        
        let tabBarColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        tabBar.backgroundColor = tabBarColor
        
        
        let mainVC = MainViewController()
        let statVC = StatViewController()
        let authorsVC = AuthorsViewController()
        viewControllers = [
            tabBarItems(for: mainVC, with: "Ставки", with: mainImage),
            tabBarItems(for: statVC, with: "Статистика", with: statImage),
            tabBarItems(for: authorsVC, with: "Авторы", with: authorsImage)
        ]
        
    }
    
    private func tabBarItems(for rootViewController: UIViewController, with title: String, with image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}

extension TabBarController {
    private func gradientBackground() {
        let gradient: CAGradientLayer = CAGradientLayer()
        let darkBlueColor = UIColor(red: 0, green: 0.4, blue: 0.7, alpha: 1)
        let blueColor = UIColor(red: 0.2, green: 0.4, blue: 1, alpha: 1)
        let lightBlueColor = UIColor(red: 0.2, green: 0.6, blue: 1, alpha: 1)

        gradient.colors = [lightBlueColor.cgColor, blueColor.cgColor, darkBlueColor.cgColor]
                gradient.locations = [0.0 , 1.0]
                gradient.startPoint = CGPoint(x : 0, y : 0)
                gradient.endPoint = CGPoint(x :1, y: 1)
                gradient.frame = view.bounds
                view.layer.addSublayer(gradient)
        
    }
    
    func setTabBar()  {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
        //tabBarAppearance.backgroundColor = .cyan
            UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
}
