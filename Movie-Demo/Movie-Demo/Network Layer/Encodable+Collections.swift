//
//  Encodable+Collections.swift.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 29/12/20.
//  Copyright © 2020 Mayank Inc. All rights reserved.
//

import Foundation

//MARK:- Convert Modal to Dictionary
public extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        let newData = Data(String(decoding: data, as: UTF8.self).utf8)
        return (try? JSONSerialization.jsonObject(with: newData, options: [])).flatMap { $0 as? [String: Any] }
    }
}
