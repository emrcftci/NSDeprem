//
//  CALayer+Additions.swift
//  Common
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit

public extension CALayer {

  var allCorners: CACornerMask {
    return [
      .layerMinXMinYCorner, .layerMaxXMinYCorner,
      .layerMinXMaxYCorner, .layerMaxXMaxYCorner
    ]
  }

  var topCorners: CACornerMask {
    return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }

  var bottomCorners: CACornerMask {
    return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
  }

  var leftCorners: CACornerMask {
    return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
  }

  var rightCorners: CACornerMask {
    return [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
  }

  func removeAllSublayers() {
    sublayers?.forEach { $0.removeFromSuperlayer() }
  }
}
