//
//  NewsViewController.swift
//  RxSwiftNews
//
//  Created by Federico Nieto on 30/05/2019.
//  Copyright © 2019 Federico Nieto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var disposeBag = DisposeBag()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        populateNews()
    }
    
    func populateNews() {
        URLRequest.load(resource: ArticlesList.all)
        .subscribe(onNext: { result in
            if let articles = result?.articles {
                self.articles = articles
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let article = articles[indexPath.row]
        cell.titleLbl.text = article.title
        cell.descriptionLbl.text = article.description
        return cell
    }
    
}
