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
        
    }
}
