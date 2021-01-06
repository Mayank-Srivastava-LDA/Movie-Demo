
//
//  Debugger.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 29/12/20.
//

import Foundation

class Debugger {

    static func printDictionary(dictionary: [String: Any]?) {
        do {
            guard let dict = dictionary else {
                debugPrint("Could not product dictionary")
                return}
            let data = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted)
            if let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue) { debugPrint(json) }
        } catch { debugPrint("JSON string could not be printed") }
    }
}
