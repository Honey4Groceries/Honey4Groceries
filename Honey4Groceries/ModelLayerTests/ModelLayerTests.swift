//
//  ModelLayerTests.swift
//  ModelLayerTests
//
//  Created by Thomas Tang on 2/8/19.
//

import XCTest
import CoreLocation
import Foundation
import PromiseKit
@testable import ModelLayer

class ModelLayerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSearchStoresReturnsDictionaryOfStores() {
        //var stores: [String: String]?
        let UCSDLocation = CLLocation(latitude: 32.8801, longitude: -117.2340)
        
        firstly {
            Store.searchStores(5000, UCSDLocation)
        }.map { stores in
            XCTAssertTrue(stores != nil)
            for (storeName, storeID) in stores! {
                XCTAssert(storeName != "")
                XCTAssert(storeID != "")
            }
        }
    }
}
