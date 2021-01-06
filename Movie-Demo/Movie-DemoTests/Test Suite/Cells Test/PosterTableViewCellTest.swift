//
//  PosterTableViewCellTest.swift
//  Movie-DemoTests
//
//  Created by Mayank Srivastava on 05/01/21.
//

import XCTest
@testable import Movie_Demo

class PosterTableViewCellTest: XCTestCase {
    
    private var sut: PosterTableViewCell?
    private var dataSourse: MovieDetailDataSourse?
    private var tableView: UITableView?
    

    override func setUpWithError() throws {
        tableView = UITableView()
        dataSourse = MovieDetailDataSourse()
        let bundle = Bundle(identifier: "com.mayank.Movie-Demo")
        let viewController = UIStoryboard(name: "Main", bundle: bundle).instantiateViewController(identifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.loadViewIfNeeded()
        tableView = viewController.tableView
        tableView?.delegate = dataSourse
        tableView?.dataSource = dataSourse
        tableView?.reloadData()
    }

    override func tearDownWithError() throws {
        sut = nil
        dataSourse = nil
        tableView = nil
    }
}


extension PosterTableViewCellTest {
    func testPosterTableViewCell_whenCellExist_returnCellTitle() {
        let testUrl = "https://m.media-amazon.com/images/M/MV5BNGE4YjU5MDAtYzYzMC00M2RlLTk0NDgtNDU1MjgyMGI0MjI3XkEyXkFqcGdeQXVyNTE1NjY5Mg@@._V1_SX300.jpg"
        let testTitle = "testTitle"
        let testYear = "testYear"
        let poster = Poster(posterUrl: testUrl, title: testTitle, year: testYear)
        dataSourse?.cellTypes.append(.header(poster: poster))
        sut = dataSourse?.tableView(tableView ?? UITableView(), cellForRowAt: IndexPath(row: 0, section: 0)) as? PosterTableViewCell
        XCTAssertEqual(sut?.poster?.posterUrl, testUrl)
        XCTAssertEqual(sut?.poster?.title, testTitle)
        XCTAssertEqual(sut?.poster?.year, testYear)
    }
}
