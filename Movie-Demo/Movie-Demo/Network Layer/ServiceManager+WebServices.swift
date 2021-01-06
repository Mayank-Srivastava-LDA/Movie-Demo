//
//  ServiceManager+WebServices.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 29/12/20.
//

import Foundation


extension ServiceManager {
    
    func getMovieList(completion: @escaping (Result<MovieListModal, NetworkError>) -> Void) {
        var component = URLComponents(string: URLConstants.baseUrl)
        component?.queryItems = [URLQueryItem(name: "apikey", value: "b9bd48a6"), URLQueryItem(name: "s", value: "Marvel"), URLQueryItem(name: "type", value: "movie")]
        guard let url = component?.url else {
            completion(.failure(.badUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        ServiceManager.shared.loadRequest(request: request, completion: completion)
    }
    
    func getMovieDetail(id: String, completion: @escaping (Result<MovieDetailModal, NetworkError>) -> Void) {        
        var component = URLComponents(string: URLConstants.baseUrl)
        component?.queryItems = [URLQueryItem(name: "apikey", value: "b9bd48a6"), URLQueryItem(name: "i", value: id), URLQueryItem(name: "type", value: "movie")]
        guard let url = component?.url else {
            completion(.failure(.badUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        ServiceManager.shared.loadRequest(request: request, completion: completion)
    }
}
