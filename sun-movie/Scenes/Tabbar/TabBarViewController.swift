//
//  TabBarViewController.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 26/04/2024.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }
    
    private func createTabBar() {
        viewControllers = [makeHome(),
                           makeFavorite(),
                           makeSetting()]
    }
    
    private func makeHome() -> UINavigationController {
        let navVC = BaseNavigationController()
        let homeUseCase = HomeUseCase()
        let homeNavigator = HomeNavigator(navigationController: navVC)
        let homeVM = HomeViewModel(useCase: homeUseCase, navigator: homeNavigator)
        let homeVC = HomeViewController()
        homeVC.bindViewModel(to: homeVM)
        homeVC.tabBarItem = TabBarItems.home.item
        navVC.viewControllers = [homeVC]
        return navVC
    }
    
    private func makeFavorite() -> UINavigationController {
        let navVC = BaseNavigationController()
        let favoriteUseCase = FavoriteUseCase()
        let favoriteNavigator = FavoriteNavigator(navigationController: navVC)
        let favoriteVM = FavoriteViewModel(useCase: favoriteUseCase, navigator: favoriteNavigator)
        let favoriteVC = FavoriteViewController()
        favoriteVC.bindViewModel(to: favoriteVM)
        favoriteVC.tabBarItem = TabBarItems.favorite.item
        navVC.viewControllers = [favoriteVC]
        return navVC
    }
    
    private func makeSetting() -> UINavigationController {
        let navVC = BaseNavigationController()
        let settingUseCase = SettingUseCase()
        let settingNavigator = SettingNavigator(navigationController: navVC)
        let settingVM = SettingViewModel(useCase: settingUseCase, navigator: settingNavigator)
        let settingVC = SettingViewController()
        settingVC.bindViewModel(to: settingVM)
        settingVC.tabBarItem = TabBarItems.setting.item
        navVC.viewControllers = [settingVC]
        return navVC
    }
}
