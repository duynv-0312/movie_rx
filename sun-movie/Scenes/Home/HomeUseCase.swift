//
//  HomeUseCase.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 26/04/2024.
//

import Foundation

protocol HomeUseCaseType {
    func getMovies(urlString: String, completion: @escaping(Result<MovieResponse, Error>) -> Void)
}

struct HomeUseCase: HomeUseCaseType {
    var movieRepository: MovieRepositoryType
    
    func getMovies(urlString: String, completion: @escaping(Result<MovieResponse, Error>) -> Void) {
        movieRepository.getMovies(urlString: urlString, completion: completion)
    }
}
