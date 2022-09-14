//
//  URlSessionMocks.swift
//  UnitTests
//
//  Created by Nishchal Visavadiya on 04/09/22.
//

import Foundation

typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    
    associatedtype DataTaskType
    
    func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
    ) -> DataTaskType
}

extension URLSession: URLSessionProtocol {}

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}

class URLSessionDataTaskMock: URLSessionDataTaskProtocol {
    
    private let completion: CompletionHandler
    private let data: Data?
    private let error: Error?
    private let response: URLResponse?
    
    init(
        data: Data?,
        error: Error?,
        response: URLResponse?,
        completion: @escaping CompletionHandler
    ) {
        self.data = data
        self.error = error
        self.response = response
        self.completion = completion
    }
    
    func resume() {
        completion(data, response, error)
    }
}

class URLSessionMock: URLSessionProtocol {
    
    // data and error can be set to provide data or an error
    var data: Data?
    var error: Error?
    var response: URLResponse?
    
    func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
    ) -> URLSessionDataTaskMock {
        return URLSessionDataTaskMock(
            data: data,
            error: error,
            response: response,
            completion: completionHandler
        )
    }
}
