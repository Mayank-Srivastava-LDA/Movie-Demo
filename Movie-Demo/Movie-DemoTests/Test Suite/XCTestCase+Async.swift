//
//  XCTestCase+Async.swift
//  Movie-DemoTests
//
//  Created by Mayank Srivastava on 05/01/21.
//

import XCTest

extension XCTestCase {
    func async<A>(timeout: TimeInterval = 10.0,
                  _ callbackMethod: (@escaping (A) -> Void) -> Void,
                  description: String = "Async Execution",
                  handler: XCWaitCompletionHandler? = nil) -> A {
        let expectaction = self.expectation(description: description)
        
        var result: A!
        callbackMethod {
            result = $0
            expectaction.fulfill()
        }
        
        waitForExpectations(timeout: timeout, handler: handler )
        return result
    }
    
    private func curry<A, B>(f: @escaping (A, B) -> Void) -> (A) -> (B) -> Void {
        return { a in { b in f(a, b) } }
    }

    func async<A, B>(_ a: A,
                     timeout: TimeInterval = 4.0,
                     _ callbackMethod: @escaping (A, @escaping (B) -> Void) -> Void,
                     description: String = "Async Execution",
                     handler: XCWaitCompletionHandler? = nil) -> B {
        let curriedCallback = curry(f: callbackMethod)(a)
        return async(timeout: timeout,
                     curriedCallback,
                     description: description,
                     handler: handler)
    }
}
