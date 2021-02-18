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
    
    @IBAction func savePictureAction(_ sender: Any) {
        guard let image = imageView.image else {
            showAlert("Error")
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        let alertText = error == nil ? "Saved!" : "Save error"
        showAlert(alertText)
    }
    
    private func showAlert(_ text: String) {
        let ac = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
}
