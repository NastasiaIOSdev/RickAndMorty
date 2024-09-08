//
//  Endpoints.swift
//  RickyAndMorty
//
//  Created by Анастасия Ларина on 11.05.2024.
//

import Foundation

struct Endpoint {
    let path: String
    var url: URL {
        var components = URLComponents(string: "https://rickandmortyapi.com")
        components?.path = path
        guard let url = components?.url else {
            preconditionFailure("Unable to create url from: \(String(describing: components))")
        }
        return url
    }
    static let posts = Self(path: "/api/episode")
//    static let posts2 = Self(path: "/api/character")
}
