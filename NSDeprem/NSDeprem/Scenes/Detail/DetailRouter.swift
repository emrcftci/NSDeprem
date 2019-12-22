//
//  DetailRouter.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 22.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Foundation

protocol DetailRoutingLogic: class {
  func dismiss()
}

protocol DetailDataPassing: class {
  var dataStore: DetailDataStore? { get }
}

final class DetailRouter: DetailRoutingLogic, DetailDataPassing {

  weak var viewController: DetailController?
  var dataStore: DetailDataStore?

  // MARK: - DetailRoutingLogic

  func dismiss() {
    viewController?.dismiss(animated: true)
  }
}
