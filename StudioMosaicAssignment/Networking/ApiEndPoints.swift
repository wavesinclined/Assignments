//
//  ApiEndPoints.swift
//  StudioMosaicAssignment
//
//  Created by alice singh on 09/09/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation

class ApiEndPoint {
    static let bitcoinNewsEndPoint = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d074d2c3ce7d490eb7e83c8769a73d9d"

}

enum ApiError: Error {
    case invalidUrl
    case custom(String)
    case noResult
    case parsing
}
