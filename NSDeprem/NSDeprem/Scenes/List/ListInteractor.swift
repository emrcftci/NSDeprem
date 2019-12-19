//
//  ListInteractor.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Foundation

protocol ListBusinessLogic: class {

  func fetchList()
}

protocol ListDataStore: class {

  var sources: [List.FetchList.ListDataSource]? { get set }
}

class ListInteractor: ListBusinessLogic, ListDataStore {

  var presenter: ListPresentationLogic?
  var worker: ListWorker?

  // MARK: - ListDataStore

  var sources: [List.FetchList.ListDataSource]?

  // MARK: - ListBusinessLogic

  func fetchList() {

    worker?.getResources { [weak self] sources in

      self?.sources = sources?.earthquakes.compactMap { List.FetchList.ListDataSource(earthquake: $0) }
      self?.checkSourcesForAction()
    }
  }
}

// MARK: - Private Helpers

private extension ListInteractor {

    func checkSourcesForAction() {

      guard sources != nil else {
        // TODO: Show failure alert
        return
      }

      self.presenter?.presentList()
    }
}
