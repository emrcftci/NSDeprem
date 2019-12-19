//
//  ListPresenter.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Foundation

protocol ListPresentationLogic: class {

  func presentList()
}

final class ListPresenter: ListPresentationLogic {

  weak var viewController: ListDisplayLogic?

  // MARK: - ListPresentationLogic

  func presentList() {
    viewController?.displayList()
  }
}
