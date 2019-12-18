//
//  UIView+Additions.swift
//  Common
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit

public extension UIView {

  // MARK: - Shadow

  func makeShadow() {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.shadowOpacity = 1
    layer.shadowOffset = .zero
    layer.shadowRadius = 3
  }

  // MARK: - Corner Radius
  func makeCornersRounded(_ radius: CGFloat, corners: CACornerMask) {
    layer.masksToBounds = true
    layer.cornerRadius = radius
    layer.maskedCorners = corners
  }

  func makeAllCornersRounded(_ radius: CGFloat) {
    makeCornersRounded(radius, corners: layer.allCorners)
  }

  func makeTopCornersRounded(_ radius: CGFloat) {
    makeCornersRounded(radius, corners: layer.topCorners)
  }

  func makeBottomCornersRounded(_ radius: CGFloat) {
    makeCornersRounded(radius, corners: layer.bottomCorners)
  }

  func makeLeftCornersRounded(_ radius: CGFloat) {
    makeCornersRounded(radius, corners: layer.leftCorners)
  }

  func makeRightCornersRounded(_ radius: CGFloat) {
    makeCornersRounded(radius, corners: layer.rightCorners)
  }
}
