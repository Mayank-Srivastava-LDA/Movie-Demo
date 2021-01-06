//
//  NetworkLayerTest.swift
//  Movie-DemoTests
//
//  Created by Mayank Srivastava on 05/01/21.
//

import XCTest
@testable import Movie_Demo



class NetworkLayerTest: XCTestCase {
    
    func testNetworkLayer_whenGetMovieListAPICalled_returnMovieList() {
        let result: Result<MovieListModal, NetworkError> = async(ServiceManager.shared.getMovieList)
        switch result {
        case .success(let movieList) where (movieList.movies?.count ?? 0) > 0:
            XCTAssertNotNil(movieList)
        default:
            XCTFail()
        }
    }
    
    func testNetworkLayer_whenGetMovieDetailAPICalled_returnMovieDetail() {
        let movieId = "tt3438640"
        let result: Result<MovieDetailModal, NetworkError> = async(movieId, ServiceManager.shared.getMovieDetail(id:completion:))
        switch result {
        case .success(let movie):
            XCTAssertNotNil(movie)
        default:
            XCTFail()
        }
    }
}


