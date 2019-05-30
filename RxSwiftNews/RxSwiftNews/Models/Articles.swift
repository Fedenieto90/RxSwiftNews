//
//  Articles.swift
//  RxSwiftNews
//
//  Created by Federico Nieto on 30/05/2019.
//  Copyright © 2019 Federico Nieto. All rights reserved.
//

import UIKit

struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList {
    
    static var all: Resource<ArticlesList> {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=09e526b26846490991d2bea65155d945")!
        return Resource(url: url)
    }
    
}

struct Article: Decodable {
    let title: String
    let description: String?
}
