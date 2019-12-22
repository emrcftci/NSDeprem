//
//  DetailInteractor.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 22.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit

protocol DetailBusinessLogic: class {

  func prepareView()
}

protocol DetailDataStore: class {

  var earthquake: List.DataSource? { get set }

}

class DetailInteractor: DetailBusinessLogic, DetailDataStore {

  var presenter: DetailPresentationLogic?
  var worker: DetailWorker?

  // MARK: - DetailDataStore

  var earthquake: List.DataSource?

  // MARK: - DetailBusinessLogic

  func prepareView() {
    if let earthquake = earthquake {
      let response = Detail.Prepare.Response(item: earthquake)
      presenter?.presentView(response: response)
    }
  }

}
