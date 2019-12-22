//
//  DetailPresenter.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 22.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Foundation

protocol DetailPresentationLogic: class {

  func presentView(response: Detail.Prepare.Response)
}

final class DetailPresenter: DetailPresentationLogic {

  weak var viewController: DetailDisplayLogic?

  // MARK: - DetailPresentationLogic

  func presentView(response: Detail.Prepare.Response) {
    let viewModel = Detail.Prepare.ViewModel(item: response.item)
    viewController?.displayView(viewModel: viewModel)
  }
}
