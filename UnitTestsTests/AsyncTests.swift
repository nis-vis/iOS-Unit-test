//
//  AsyncTests.swift
//  UnitTestsTests
//
//  Created by Nishchal Visavadiya on 04/09/22.
//

import XCTest
@testable import UnitTests

class AsyncTests: XCTestCase {
    
    var sut: URLSessionMock!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLSessionMock()
    }
    
    func testApiCallCompletes() throws {
        // given
        let urlString = "http://www.randomnumberapi.com/test"
        let url = URL(string: urlString)!
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        sut.response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        let dataTask = sut.dataTask(with: url) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
}
