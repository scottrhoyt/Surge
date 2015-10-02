//
//  ArrayFFTExtensionsTests.swift
//  Surge
//
//  Created by Scott Hoyt on 9/29/15.
//  Copyright © 2015 Scott Hoyt. All rights reserved.
//

import XCTest
import Surge

class ArrayFFTExtensionsTests: XCTestCase {
    
    let testVector = [FFTCalls]()

    func test_calls_fft() {
        XCTAssertEqual(FFTCalls.FFT, testVector.fft()[0])
    }

}
