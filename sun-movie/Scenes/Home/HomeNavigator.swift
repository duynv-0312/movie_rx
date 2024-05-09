//
//  HomeNavigator.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 26/04/2024.
//

import Foundation
import UIKit

protocol HomeNavigatorType {
    func toMovieDetailScreen(movieID: Int)
    func toSearchMovieScreen()
    func toListMovieScreen()
}

struct HomeNavigator: HomeNavigatorType {
    var navigationController = UINavigationController()

    func toMovieDetailScreen(movieID: Int) {
        let useCase = MovieDetailUseCase()
        let navigator = MovieDetailNavigator(navigationController: navigationController)
        let vm = MovieDetailViewModel(useCase: useCase, navigator: navigator)
        let vc = MovieDetailViewController()
        vc.bindViewModel(to: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toSearchMovieScreen() {
        let useCase = SearchUseCase()
        let navigator = SearchNavigator(navigationController: navigationController)
        let vm = SearchViewModel(useCase: useCase, navigator: navigator)
        let vc = SearchViewController()
        vc.bindViewModel(to: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toListMovieScreen() {
        let useCase = ListMovieUseCase()
        let navigator = ListMovieNavigator(navigationController: navigationController)
        let vm = ListMovieViewModel(useCase: useCase, navigator: navigator)
        let vc = ListMovieViewController()
        vc.bindViewModel(to: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}
