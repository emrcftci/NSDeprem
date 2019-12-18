//
//  NibLoadable.swift
//  UIComp
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit

// MARK: - UIView

public protocol NibLoadable: class {
  static var defaultNibName: String { get }
  static var bundle: Bundle? { get }
  static func loadFromNib() -> Self
}

extension NibLoadable {

  public static var bundle: Bundle? {
    return Bundle(for: self)
  }
}

// MARK: - UIView

extension NibLoadable where Self: UIView {

  public static var defaultNibName: String {
    return String(describing: self)
  }

  public static var defaultNib: UINib {
    return UINib(nibName: defaultNibName, bundle: bundle)
  }

  public static func loadFromNib() -> Self {
    guard let nib = bundle?.loadNibNamed(defaultNibName,
                                         owner: nil,
                                         options: nil)?.first as? Self
      else {
        fatalError("[NibLoadable] Cannot load view from nib.")
    }
    return nib
  }
}
