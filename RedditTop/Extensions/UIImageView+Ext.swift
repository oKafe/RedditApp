//
//  UIImageView+Ext.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import Foundation
import UIKit

extension UIImageView {
  func loadImage(from urlString: String?) {
    if let urlString = urlString {
        ImageLoaderSingleton.shared.load(urlString, for: self)
    }
  }

  func cancelImageLoading() {
    ImageLoaderSingleton.shared.cancel(for: self)
  }
}
