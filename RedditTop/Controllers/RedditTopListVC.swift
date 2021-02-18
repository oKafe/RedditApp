//
//  ViewController.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import UIKit

class RedditTopListVC: UIViewController {
    
    @IBOutlet weak var topListTableView: UITableView!
    
    private var redditTopChilds: [Model<Child>]?
    
    private let dataRequestsManager = RedditTopListRequestsManager(limit: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataRequestsManager.refresh { (result, error) in
            self.updateDataList(model: result)
        }
    }
    
    private func updateDataList(model: Model<RedditTop>?) {
        guard let childs = model?.data?.children else { return }
        if redditTopChilds != nil {
            redditTopChilds?.append(contentsOf: childs)
        } else {
            redditTopChilds = childs
        }
        topListTableView.reloadData()
    }
    
    private func isLastCell(_ indexPath: IndexPath) -> Bool {
        return indexPath.row >= (self.redditTopChilds?.count ?? 0) - 2
    }
    
    private func loadNext() {
        dataRequestsManager.loadNext { (result, error) in
            self.updateDataList(model: result)
        }
    }
    
}

//MARK: - TableView
extension RedditTopListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return redditTopChilds?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RedditTopListCell", for: indexPath) as? RedditTopListCell else { return UITableViewCell() }
        
        if let redditTopChild = redditTopChilds?[indexPath.row] {
            cell.configureWith(redditTopChild)
        }
        
        if self.isLastCell(indexPath) {
            self.loadNext()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
