//
//  HomeInteractor.swift
//  StudioMosaicAssignment
//
//  Created by alice singh on 09/09/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation

protocol HomeDisplayLogic {
    func renderViewModels(_ viewModels: [NewsViewModel])
}

protocol HomeBusinessLogic {
    func viewDidLoad()
}

class HomeIterator: HomeBusinessLogic {
    weak var controller: HomeController?
    
    func viewDidLoad() {
        fetchData()
    }
}

extension HomeIterator {
    func fetchData() {
        NewsAPI.newsGET().done { (response) in
            let items = response.articles ?? []
            let viewModels = self.makeViewModels(items)
            self.controller?.renderViewModels(viewModels)
            }.catch { print($0) }
    }
    
    func makeViewModels(_ articles: [Article]) -> [NewsViewModel] {
      let viewModels = articles.compactMap { (article) -> NewsViewModel in
            return NewsViewModel(
                title: article.title,
                description: article.description,
                imageUrl: article.urlToImage,
                url: article.url
            )
        }
        return viewModels
    }
}
