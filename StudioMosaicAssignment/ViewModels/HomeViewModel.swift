//
//  HomeViewModel.swift
//  StudioMosaicAssignment
//
//  Created by alice singh on 09/09/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation

protocol ViewModelType { }

struct NewsViewModel: ViewModelType {
    var title: String?
    var description: String?
    var imageUrl: URL?
    var url: URL?
}
