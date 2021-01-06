//
//  ServiceManager.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 29/12/20.
//

import Foundation

//MARK:- Network Error Management
public enum NetworkError: Error {
    case noInternetError
    case domainError
    case decodingError
    case badUrl
    
    private struct __ {
        struct title {
            static let noInternet = "Not Reachable"
            static let domainError = "Domain Error"
            static let decodingError = "Decoding Error"
            static let badUrl = "Bad url"
        }
        struct description {
            static let noInternet = "Please check internet"
            static let domainError = "Server is down. Please try again"
            static let decodingError = "Some inconsistancies occured"
            static let badUrl = "Sorry, we are using bad url"
        }
    }
    
    var networkHandler: (String, String) {
        return (title, description)
    }
    
    private var title: String {
        switch self {
        case .noInternetError:
            return __.title.noInternet
        case .domainError:
            return __.title.domainError
        case .decodingError:
            return __.title.decodingError
        case .badUrl:
        return __.title.badUrl
        
        }
    }
    
    private var description: String {
        switch self {
        case .noInternetError:
            return __.description.noInternet
        case .domainError:
            return __.description.domainError
        case .decodingError:
            return __.description.decodingError
        case .badUrl:
            return __.description.badUrl
        }
    }
}

//MARK:- API Call
public class ServiceManager {
    public static let shared = ServiceManager()

    public func loadRequest<T: Codable>(request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            Debugger.printDictionary(dictionary: data?.dictionary)
            if let error = error as NSError?, error.domain == NSURLErrorDomain {
                DispatchQueue.main.async {
                    completion(.failure(.domainError))
                }
                return
            } else {
                if let newData = data {
                    do {
                        let data = Data(String(decoding: newData, as: UTF8.self).utf8)
                        let result = try JSONDecoder().decode(T.self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(result))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(.decodingError))
                        }
                    }
                }
            }
        }.resume()
    }
}

//MARK:- Alternate Datasourse
/*
 If API fails to while testing the build then it acts as alternate mechanism to develop the app by calling data locally.
 */
extension ServiceManager {
    func sload<T: Decodable>(_ filename: String, bundle: Bundle?) -> T? {
        let data: Data
        guard let file = bundle?.url(forResource: filename, withExtension: "json") else {
            return nil
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            return nil
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}
