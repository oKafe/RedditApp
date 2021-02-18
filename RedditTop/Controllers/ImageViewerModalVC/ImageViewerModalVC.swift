//
//  ImageViewerModalVC.swift
//  RedditTop
//
//  Created by Andy Orphan on 18.02.2021.
//

import UIKit

class ImageViewerModalVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.loadImage(from: imageUrl)
        // Do any additional setup after loading the view.
    }

}
