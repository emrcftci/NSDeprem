//
//  ListPresenter.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import MapKit

protocol ListPresentationLogic: class {

  func presentList(response: [List.DataSource])
  func presentDetail()
}

final class ListPresenter: ListPresentationLogic {

  weak var viewController: ListDisplayLogic?

  // MARK: - ListPresentationLogic

  func presentList(response: [List.DataSource]) {

    let viewModel = List.Fetch.ViewModel(earthquakes: response)
    viewController?.displayList(viewModel: viewModel)
  }

  func presentDetail() {
    viewController?.displayDetail()
  }
}
