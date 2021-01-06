//
//  ServiceManager.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 05/01/20.
//

import XCTest
@testable import Movie_Demo

class MovieListModalTest: XCTestCase {
    
    private var movieList: MovieListModal?

    override func setUpWithError() throws {
        movieList = ServiceManager.shared.load("MovieListModal", bundle: Bundle(for: type(of: self)))
    }

    override func tearDownWithError() throws {
        movieList = nil
    }
}



//MARK:- MovieListModal Test
extension MovieListModalTest {
    
    func testMovieListModal_whenMovieListModalSucceeds_returnTotalResults() {
        let totalResults = movieList?.totalResults
        XCTAssertNotNil(totalResults)
    }
    
    func testMovieListModal_whenMovieListModalSucceeds_returnResponse() {
        let response = movieList?.response
        XCTAssertNotNil(response)
    }
    
    func testMovieListModal_whenMovieListModalSucceeds_returnMoviesCount() {
        let count = movieList?.movies?.count ?? 0
        XCTAssertNotEqual(count, 0)
    }
}

//MARK:- Movie Test
extension MovieListModalTest {
    
    private var movie: Movie? {
        guard let count = movieList?.movies?.count, count > 0 else { return nil }
        return movieList?.movies?[Int.random(in: 0...count)]
    }
    
    func testMovieListModal_whenMovieExist_returnTitle() {
        let title = movie?.title
        XCTAssertNotNil(title)
    }
    
    func testMovieListModal_whenMovieExist_returnYear() {
        let year = movie?.year
        XCTAssertNotNil(year)
    }
    
    func testMovieListModal_whenMovieExist_returnImdbID() {
        let imdbID = movie?.imdbID
        XCTAssertNotNil(imdbID)
    }
    
    func testMovieListModal_whenMovieExist_returnType() {
        let type = movie?.type
        XCTAssertNotNil(type)
    }
}
