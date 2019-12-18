//
//  ListRouter.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Foundation

protocol ListRoutingLogic: class {

}

protocol ListDataPassing: class {
  var dataStore: ListDataStore? { get }
}

final class ListRouter: ListRoutingLogic, ListDataPassing {

  weak var viewController: ListController?
  var dataStore: ListDataStore?

}
