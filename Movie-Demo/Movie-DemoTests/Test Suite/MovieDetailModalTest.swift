//
//  MovieDetailModalTest.swift
//  Movie-DemoTests
//
//  Created by Mayank Srivastava on 05/01/21.
//

import XCTest
@testable import Movie_Demo

class MovieDetailModalTest: XCTestCase {
    private var movieDetail: MovieDetailModal?

    override func setUpWithError() throws {
        movieDetail = ServiceManager.shared.load("MovieDetailModal", bundle: Bundle(for: type(of: self)))
    }

    override func tearDownWithError() throws {
        movieDetail = nil
    }
}



//MARK:- MovieDetailModalTest Test
extension MovieDetailModalTest {
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnTitle() {
        let title = movieDetail?.title
        XCTAssertNotNil(title)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnYear() {
        let year = movieDetail?.year
        XCTAssertNotNil(year)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnRated() {
        let rated = movieDetail?.rated
        XCTAssertNotNil(rated)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnReleased() {
        let released = movieDetail?.released
        XCTAssertNotNil(released)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnRuntime() {
        let runtime = movieDetail?.runtime
        XCTAssertNotNil(runtime)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnGenre() {
        let genre = movieDetail?.genre
        XCTAssertNotNil(genre)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnDirector() {
        let director = movieDetail?.director
        XCTAssertNotNil(director)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnWriter() {
        let writer = movieDetail?.writer
        XCTAssertNotNil(writer)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnActors() {
        let actors = movieDetail?.actors
        XCTAssertNotNil(actors)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnPlot() {
        let plot = movieDetail?.plot
        XCTAssertNotNil(plot)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnLanguage() {
        let language = movieDetail?.language
        XCTAssertNotNil(language)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnCountry() {
        let country = movieDetail?.country
        XCTAssertNotNil(country)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnAwards() {
        let awards = movieDetail?.awards
        XCTAssertNotNil(awards)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnPoster() {
        let poster = movieDetail?.poster
        XCTAssertNotNil(poster)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnMetascore() {
        let metascore = movieDetail?.metascore
        XCTAssertNotNil(metascore)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnImdbRating() {
        let imdbRating = movieDetail?.imdbRating
        XCTAssertNotNil(imdbRating)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnImdbVotes() {
        let imdbVotes = movieDetail?.imdbVotes
        XCTAssertNotNil(imdbVotes)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnImdbID() {
        let imdbID = movieDetail?.imdbID
        XCTAssertNotNil(imdbID)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnType() {
        let type = movieDetail?.type
        XCTAssertNotNil(type)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnDvd() {
        let dvd = movieDetail?.dvd
        XCTAssertNotNil(dvd)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnBoxOffice() {
        let boxOffice = movieDetail?.boxOffice
        XCTAssertNotNil(boxOffice)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnProduction() {
        let production = movieDetail?.production
        XCTAssertNotNil(production)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnWebsite() {
        let website = movieDetail?.website
        XCTAssertNotNil(website)
    }
    
    func testMovieDetailModal_whenMovieDetailModalSucceeds_returnResponse() {
        let response = movieDetail?.response
        XCTAssertNotNil(response)
    }
}
