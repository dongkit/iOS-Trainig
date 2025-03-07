//
//  MainTabBarController.swift
//  iOSTrainig
//
//  Created by FDC-Kit on 3/6/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = UINavigationController(rootViewController: DashboardViewController())
        let favoriteTutorVC = UINavigationController(rootViewController: FavoriteTutorViewController())
        let textbookVC = UINavigationController(rootViewController: TextbookViewController())
        let learningVC = UINavigationController(rootViewController: LearningViewController())
        let myPageVC = UINavigationController(rootViewController: MyPageViewController())
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        favoriteTutorVC.tabBarItem = UITabBarItem(title: "Favorite Tutor", image: UIImage(systemName: "heart"), tag: 1)
        textbookVC.tabBarItem = UITabBarItem(title: "Textbook", image: UIImage(systemName: "bookmark"), tag: 2)
        learningVC.tabBarItem = UITabBarItem(title: "Learning", image: UIImage(systemName: "pencil"), tag: 3)
        myPageVC.tabBarItem = UITabBarItem(title: "My Page", image: UIImage(systemName: "person.circle"), tag: 4)
        
        viewControllers = [homeVC, favoriteTutorVC, textbookVC, learningVC, myPageVC]

    }
}
