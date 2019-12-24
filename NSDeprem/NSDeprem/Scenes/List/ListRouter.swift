//
//  ListRouter.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Common
import UIKit

protocol ListRoutingLogic: class {

  func routeToDetail()
}

protocol ListDataPassing: class {
  var dataStore: ListDataStore? { get }
}

final class ListRouter: ListRoutingLogic, ListDataPassing {

  weak var viewController: ListController?
  var dataStore: ListDataStore?

  func routeToDetail() {
    let storyboard = UIStoryboard(name: Constants.Identifiers.detailStoryboard.rawValue, bundle: nil)

    if let detailController = storyboard.instantiateViewController(withIdentifier: Constants.Identifiers.detailController.rawValue) as? DetailController {

      detailController.router?.dataStore?.earthquake = dataStore?.selectedEarthquake
      viewController?.present(detailController, animated: true)
    }
  }
}
