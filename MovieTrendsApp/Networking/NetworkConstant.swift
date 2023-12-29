//
//  NetworkConstant.swift
//  MovieTrendsApp
//
//  Created by António Loureiro on 27/12/2023.
//

import Foundation

class NetworkConstant {

    public static var shared: NetworkConstant = NetworkConstant()

    private init() {
        /// Singleton init
    }

    public var apiKey: String {

        get {
            /// Api key from //https://www.themoviedb.org/
            return "7425fbbadd02d0b24c669d4d34a257b9"
        }
    }

    public var serverAddress: String {

        get {

            return "https://api.themoviedb.org/3/"
        }
    }

    public var imageServerAddress: String {

        get {

            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
