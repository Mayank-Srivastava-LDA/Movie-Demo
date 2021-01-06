//
//  Constants.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 29/12/20.
//

import Foundation

typealias URLConstants = Constants.URLConstants
typealias HTTPMethod = Constants.HTTPMethod
typealias InternetConnectivity = Constants.ToastMassege.InternetConnectivity
typealias URLParameters = Constants.URLConstants.Parameters


struct Constants {
    struct URLConstants {
        static let baseUrl = "http://www.omdbapi.com/"
        struct Parameters {
            static let apikey = "b9bd48a6"
            static let sValue = "Marvel"
            static let type = "movie"
        }
    }
    public enum HTTPMethod: String {
        case get     = "GET"
        case post    = "POST"
        case put     = "PUT"
        case delete  = "DELETE"
    }
    struct ToastMassege {
        struct InternetConnectivity {
            static let connectivityLost = "Internet connectivity lost"
            static let connectivityAchieved = "Internet connectivity achieved"
            static let noInternetNotification = "Could not notifiy internet connectivity"
            static let duration: Double = 3.0
        }
    }
}

