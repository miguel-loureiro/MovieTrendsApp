//
//  MainViewModel.swift
//  MovieTrendsApp
//
//  Created by António Loureiro on 27/12/2023.
//

import Foundation

class MainViewModel {

    var isLoading: Observable<Bool> = Observable(false)

    func numberOfSections() -> Int {

        return 1
    }

    func numberOfRows(in section: Int) -> Int {

        return 5
    }

    /// Because all data handling must be done here then fetch data is here

    /// Completion handler version
   /* func fetchData() {
            APICaller.getTrendingMovies { [weak self] result in
                switch result {
                case .success(let trendingMovies):
                    // Handle successful result here (e.g., update the UI, store data, etc.)
                        print(trendingMovies.results.count)
                case .failure(let error):
                    // Handle error here (e.g., show an alert)
                    print(error)
                }
            }
    } */


    /// Async Await version
    func fetchData() async {

        if isLoading.value ?? true {

            return
        }
            do {
                
                let trendingMovies = try await APICaller.getTrendingMovies()
                // Handle successful result here (e.g., update the UI, store data, etc.)
                print(trendingMovies.results.count)
            } catch {
                // Handle error here (e.g., show an alert)
                if let networkError = error as? NetworkError {
                    print(networkError)
                } else {
                    print(error)
                }
            }
        }
}
