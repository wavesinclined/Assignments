//
//  DataModels.swift
//  StudioMosaicAssignment
//
//  Created by alice singh on 09/09/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation

struct NewsResponse: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

struct Article: Decodable {
    var title: String?
    var description: String?
    var url: URL?
    var urlToImage: URL?
}
