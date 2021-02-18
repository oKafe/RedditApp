//
//  RedditTopListCell.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import UIKit

class RedditTopListCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var numberOfCommentsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = UIImage(named: "placeholderImage")
        thumbnailImageView.cancelImageLoading()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(_ model: Model<Child>) {
        postTitleLabel.text = model.data?.title
        thumbnailImageView.loadImage(from: model.data?.thumbnail)
        numberOfCommentsLabel.text = "\(model.data?.numberOfComments ?? 0) Comments"
        guard let createdAt = model.data?.createdUTC else {
            timeLabel.text = nil
            return
        }
        let createdDate = Date(timeIntervalSince1970: createdAt)
        timeLabel.text = "\(model.data?.author ?? "") \(createdDate.timeAgoString())"
    }

}
