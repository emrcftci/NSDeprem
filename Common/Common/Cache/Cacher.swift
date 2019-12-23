//
//  Cacher.swift
//  Common
//
//  Created by Emre Çiftçi on 23.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit

public class Cacher {

  public static let shared = Cacher()

  private let imageCache = NSCache<NSString, UIImage>()

  public func cacheImage(with image: UIImage, for key: String, _ completion: @escaping ImageCallback) {
    imageCache.setObject(image, forKey: key as NSString)
    completion(image)
  }

  public func cachedImage(for key: String) -> UIImage? {
    return imageCache.object(forKey: key as NSString)
  }
}
