//
//  ViewController.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import UIKit

class RedditTopListVC: UIViewController {
    
    @IBOutlet weak var topListTableView: UITableView!
    
    private var redditTopChilds = [Model<Child>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RedditTopNetworkManager.getRedditTop { (result, response, error) in
            if let result = result {
                DispatchQueue.main.async {
                    self.redditTopChilds = result.data?.children ?? [Model<Child>]()
                    self.topListTableView.reloadData()
                }
            }
        }
    }
}

//MARK: - TableView
extension RedditTopListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return redditTopChilds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RedditTopListCell", for: indexPath) as? RedditTopListCell else { return UITableViewCell() }
        
        let redditTopChild = redditTopChilds[indexPath.row]
        
        cell.configureWith(redditTopChild)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
