//
//  AppNetworkingTests.swift
//  
//
//  Created by Sergei on 22.09.2024.
//

import XCTest
@testable import AppCore

final class AppNetworkingTests: XCTestCase {

    func testLoadDataCall() {
        let manager = AppCore.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        guard let url = URL(string: "https://kodeco.com") else {
            XCTFail("Could not create URL properly")
            return
        }
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

}
