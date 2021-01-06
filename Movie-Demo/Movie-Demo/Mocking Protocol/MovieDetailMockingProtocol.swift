//
//  MovieDetailMockingProtocol.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 06/01/21.
//

import Foundation

//MARK:- Protocol Declaring Scope of Testing
protocol MovieDetailTestMockProtocol: class {
    func onViewLoaded()
    func onFetchData()
}

protocol MovieDetailMokingProtocol: AnyObject {
    //func renderDetails(countryViewModel: AboutCountryViewModel)
}

public class MovieDetailControllerMock: MovieDetailTestMockProtocol {
    private (set) var onViewLoadedCalled = false
    private (set) var onFetchDataCalled = false
    func onViewLoaded() {
        onViewLoadedCalled = true
    }
    
    func onFetchData() {
        onFetchDataCalled = true
    }
}
