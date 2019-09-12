//
//  NewsAPI.swift
//  StudioMosaicAssignment
//
//  Created by alice singh on 09/09/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation
import PromiseKit

class NewsAPI {
    class func newsGET() -> Promise<NewsResponse> {
        guard let url = URL(string: ApiEndPoint.bitcoinNewsEndPoint) else  { return Promise(error: ApiError.invalidUrl)}
        
        return get(url)
    }
}

func get<T: Decodable>(_ url: URL) -> Promise<T> {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    return URLSession
        .shared
        .dataTask(.promise, with: request)
        .map { try decode($0.data) }
}

func decode<T: Decodable>(_ data: Data) throws -> T {
    return try JSONDecoder().decode(T.self, from: data)
}

