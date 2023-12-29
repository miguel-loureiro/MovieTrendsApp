//
//  Constants.swift
//  MovieTrendsApp
//
//  Created by António Loureiro on 27/12/2023.
//

import Foundation

struct Constants {
    
    //    MARK: constants declaration/initialization for API access and data fetch
    struct API {
        static let scheme = "https"
        static let host = "api.themoviedb.org/"
        static let relativePath = "/3"
        static let timeStamp = String(Date().timeIntervalSince1970)
        static let apiKey = "7425fbbadd02d0b24c669d4d34a257b9"
        static let apiBaseEndPoint = "https://api.themoviedb.org/"
        static let limit = 20
        static let offset = 0
    }
}
