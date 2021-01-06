//
//  MovieDetailViewControllerTest.swift
//  Movie-DemoTests
//
//  Created by Mayank Srivastava on 06/01/21.
//

import XCTest
@testable import Movie_Demo

class MovieDetailViewControllerTest: XCTestCase {
    var sut: MovieDetailViewController?
    var presenter: MovieDetailControllerMock?
    
    override func setUpWithError() throws {
        
        let bundle = Bundle(identifier: "com.mayank.Movie-Demo")
        sut = UIStoryboard(name: "Main", bundle: bundle).instantiateViewController(identifier: "MovieDetailViewController") as? MovieDetailViewController
        presenter = MovieDetailControllerMock()
        sut?.presenter = presenter
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        presenter = nil
    }
}

extension MovieDetailViewControllerTest {
    
    func testMovieDetailViewController_whenViewIsLoaded_returnOnViewLoadedCalledFlag() {
        sut?.viewDidLoad()
        let onViewLoadedCalled = presenter?.onViewLoadedCalled ?? false
        XCTAssertTrue(onViewLoadedCalled)
    }
    
    func testMovieDetailViewController_whenViewIsLoaded_returnOnFetchDataCalledFlag() {
        sut?.viewDidLoad()
        let onFetchDataCalled = presenter?.onFetchDataCalled ?? false
        XCTAssertTrue(onFetchDataCalled)
    }
}
