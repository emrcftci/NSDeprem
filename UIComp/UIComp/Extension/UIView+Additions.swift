//
//  UIView+Additions.swift
//  Common
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit

// MARK: - Corner Radius

public extension UIView {

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

// MARK: - Shadow

public extension UIView {

  func makeShadow() {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.shadowOpacity = 1
    layer.shadowOffset = .zero
    layer.shadowRadius = 3
  }

  struct Shadow {

    public enum Position: Int {
      case top = -1
      case bottom = 1
    }

    public var color: UIColor
    public var opacity: Float
    public var radius: CGFloat
    public var offset: CGFloat
    public var position: Position

    public static let top = Shadow(
      color: UIColor.lightGray,
      opacity: 0.15, radius: 6.0, offset: 6, position: .top)

    public static let bottom = Shadow(
      color: UIColor.lightGray,
      opacity: 0.15, radius: 6.0, offset: 6, position: .bottom)
  }

  func addShadow(_ shadow: Shadow) {
    let position = shadow.offset * CGFloat(shadow.position.rawValue)

    layer.shadowColor = shadow.color.cgColor
    layer.shadowOffset = CGSize(width: 0, height: position)
    layer.shadowRadius = shadow.radius
    layer.shadowOpacity = shadow.opacity
  }
}

