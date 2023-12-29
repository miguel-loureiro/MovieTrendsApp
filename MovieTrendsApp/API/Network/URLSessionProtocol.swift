//
//  URLSessionProtocol.swift
//  MovieTrendsApp
//
//  Created by António Loureiro on 27/12/2023.
//

import Foundation

protocol URLSessionProtocol {

    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol { }
