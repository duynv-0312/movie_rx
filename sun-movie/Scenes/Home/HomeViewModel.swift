//
//  HomeViewModel.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 26/04/2024.
//

import Foundation

struct HomeViewModel {
    var useCase: HomeUseCaseType
    var navigator: HomeNavigatorType
}

extension HomeViewModel {
    func getMovies(urlString: String, completion: @escaping(Result<MovieResponse, Error>) -> Void) {
        useCase.getMovies(urlString: urlString, completion: completion)
    }
}
