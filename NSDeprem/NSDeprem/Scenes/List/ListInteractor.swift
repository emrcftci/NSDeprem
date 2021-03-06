//
//  ListInteractor.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Common
import MapKit

protocol ListBusinessLogic: class {

  func fetchList()
  func selectItem(at index: Int, with image: UIImage?)
}

protocol ListDataStore: class {

  var selectedEarthquake: List.DataSource? { get set }
  var sources: [List.DataSource]? { get set }
}

class ListInteractor: ListBusinessLogic, ListDataStore {

  var presenter: ListPresentationLogic?
  var worker: ListWorker?

  // MARK: - ListDataStore

  var selectedEarthquake: List.DataSource?
  var sources: [List.DataSource]?

  // MARK: - ListBusinessLogic

  func fetchList() {

    worker?.getResources { [weak self] response in
      self?.checkSourcesForAction(with: response)
    }
  }

  func selectItem(at index: Int, with image: UIImage?) {
    selectedEarthquake = sources?[index]
    presenter?.presentDetail()
  }
  
}

// MARK: - Private Helpers

private extension ListInteractor {

  func checkSourcesForAction(with response: List.Fetch.Response?) {

    guard let response = response else { return }

    sources = response.earthquakes.compactMap {
      List.DataSource(earthquake: $0)
    }

    setPreviews {

      if let sources = self.sources {
        self.presenter?.presentList(response: sources)
      }
    }
  }

  func setPreviews(_ completion: @escaping VoidCallback) {

    let dispatchGroup = DispatchGroup()

    sources?.enumerated().forEach { index, earthquake in
      dispatchGroup.enter()

      worker?.cacheImage(with: earthquake) { preview in
        earthquake.zonePreview = preview
        dispatchGroup.leave()
      }
    }

    dispatchGroup.notify(queue: .main, execute: completion)
  }
}
