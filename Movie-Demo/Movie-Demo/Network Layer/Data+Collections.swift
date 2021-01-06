//
//  Data+Collections.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 29/12/20.
//  Copyright © 2020 Mayank Inc. All rights reserved.
//

import Foundation

//MARK:- Convert Data to Dictionary
public extension Data {
    var dictionary: [String: Any]? {
        let data = Data(String(decoding: self, as: UTF8.self).utf8)
        return (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)).flatMap { $0 as? [String: Any] }
    }
}
