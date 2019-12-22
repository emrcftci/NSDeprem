//
//  ListPresenter.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import MapKit

protocol ListPresentationLogic: class {

  func presentList(response: List.Fetch.Response)
  func presentDetail()
}

final class ListPresenter: ListPresentationLogic {

  weak var viewController: ListDisplayLogic?

  // MARK: - ListPresentationLogic

  func presentList(response: List.Fetch.Response) {
    let dataSource = response.earthquakes.map { earthquake in
      List.DataSource(earthquake: earthquake)
    }

    let viewModel = List.Fetch.ViewModel(earthquakes: dataSource)
    viewController?.displayList(viewModel: viewModel)
  }

  func presentDetail() {
    viewController?.displayDetail()
  }
}
