//
//  MovieListModal.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 29/12/20.
//

import Foundation

// MARK: - MovieListModal
struct MovieListModal: Codable {
    let movies: [Movie]?
    let totalResults, response: String?

    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Movie: Codable {
    let title, year, imdbID: String?
    let type: TypeEnum?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
}
