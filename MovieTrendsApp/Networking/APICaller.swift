//
//  APICaller.swift
//  MovieTrendsApp
//
//  Created by António Loureiro on 27/12/2023.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case unableToParseData

    var customMessage: String {
        switch self {
            case .invalidURL:
                return "Invalid url"
            case .unableToParseData:
                return "No data / wrong data"
        }
    }
}

/// Completion handler version
/*public class APICaller {

    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMovieModel, NetworkError>) -> Void) {
        if NetworkConstant.shared.apiKey.isEmpty {
            print("<!> API KEY is Missing <!>")
            print("<!> Get One from: https://www.themoviedb.org/ <!>")
            return
        }

        let urlString = NetworkConstant.shared.serverAddress +
        "trending/all/day?api_key=" +
        NetworkConstant.shared.apiKey

        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }

        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}*/

/// Async Await version
/*public class APICaller {

    static func getTrendingMovies() async throws -> TrendingMovieModel {
        if NetworkConstant.shared.apiKey.isEmpty {
            print("<!> API KEY is Missing <!>")
            print("<!> Get One from: https://www.themoviedb.org/ <!>")
            throw NetworkError.urlError
        }

        let urlString = NetworkConstant.shared.serverAddress +
        "trending/all/day?api_key=" +
        NetworkConstant.shared.apiKey

        guard let url = URL(string: urlString) else {
            throw NetworkError.urlError
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            return try JSONDecoder().decode(TrendingMovieModel.self, from: data)
        } catch {
            throw NetworkError.canNotParseData
        }
    }*/

    public class APICaller {

        static func getTrendingMovies() async throws -> TrendingMovieModel {
            try checkAPIKey()

            var urlComponents = URLComponents(string: NetworkConstant.shared.serverAddress + "trending/all/day")
            urlComponents?.queryItems = [URLQueryItem(name: "api_key", value: NetworkConstant.shared.apiKey)]

            guard let url = urlComponents?.url else {
                throw NetworkError.invalidURL            }

            let (data, _) = try await URLSession.shared.data(from: url)

            do {
                return try JSONDecoder().decode(TrendingMovieModel.self, from: data)
            } catch {
                throw NetworkError.unableToParseData
            }
        }

        private static func checkAPIKey() throws {
            guard !NetworkConstant.shared.apiKey.isEmpty else {
                print("<!> API Key is Missing <!>")
                print("<!> Get One from: https://www.themoviedb.org/ <!>")
                throw NetworkError.invalidURL
            }
        }
    }
