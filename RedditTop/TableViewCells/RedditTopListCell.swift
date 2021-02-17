//
//  RedditTopListCell.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import UIKit

class RedditTopListCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(_ model: Model<Child>) {
        self.postTitleLabel.text = model.data?.title
    }

}
