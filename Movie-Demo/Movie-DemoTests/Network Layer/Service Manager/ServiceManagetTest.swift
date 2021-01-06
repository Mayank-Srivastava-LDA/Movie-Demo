//
//
//  ServiceManagerTest.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 05/09/20.
//  Copyright © 2020 Mayank Inc. All rights reserved.
//

import Foundation
import XCTest
import Movie_Demo

extension ServiceManager {

    func load<T: Decodable>(_ filename: String, bundle: Bundle?) -> T? {
        let data: Data
        guard let file = bundle?.url(forResource: filename, withExtension: "json") else {
            XCTFail("Missing file: \(filename).json")
            return nil
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            XCTFail("Content is not valid")
            return nil
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            XCTFail("Couldn't parse \(filename) as \(T.self):\n\(error)")
            return nil
        }
    }
}
