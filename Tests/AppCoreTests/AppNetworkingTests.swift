//
//  AppNetworkingTests.swift
//  
//
//  Created by Sergei on 22.09.2024.
//

import XCTest
@testable import AppCore

class NetworkSessionMock: NetworkSession {
    var data: Data?
    var error: Error?
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
    
    func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
    
    
}

struct MockData: Codable, Equatable {
    var id: Int
    var name: String
}

final class AppNetworkingTests: XCTestCase {

    func testLoadDataCall() {
        let manager = AppCore.Networking.Manager()
        let session = NetworkSessionMock()
        manager.session = session
        let expectation = XCTestExpectation(description: "Called for data")
        let data = Data([0, 1, 0, 1])
        session.data = data
        let url = URL(fileURLWithPath: "url")
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertNotNil(returnedData, "Response data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "Error in forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }

    func testSendDataCall() {
        let manager = AppCore.Networking.Manager()
        let session = NetworkSessionMock()
        let sampleObject = MockData(id: 1, name: "Serg")
        let data = try? JSONEncoder().encode(sampleObject)
        session.data = data
        manager.session = session
        
        let expectation = XCTestExpectation(description: "Sent data")
        
        let url = URL(fileURLWithPath: "url")
        
        manager.sendData(to: url, body: sampleObject) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                let returnedObject = try? JSONDecoder().decode(MockData.self, from: returnedData)
                XCTAssertEqual(returnedObject, sampleObject)
                break
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "Error in forming error result")
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }

}
