//
//  ListWorker.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Common
import Networking

final public class ListWorker {

  private let sessionProvider = URLSessionProvider()

  private let cacher = Cacher.shared

  public typealias ResourcesHandler = ((List.Fetch.Response?) -> Void)
}

// MARK: - Service Calls

public extension ListWorker {

  func getResources(completion: @escaping ResourcesHandler) {
    sessionProvider.request(type: List.Fetch.Response.self, service: EarthQuakeService.getList) { response in

      switch response {
      case let .success(sources):
        completion(sources)

      case .failure(_):
        completion(nil)
      }

    }
  }

  func cacheImage(with item: List.DataSource, _ completion: @escaping ImageCallback) {

    let imageKey = "\(item.date)\(item.intensity)"

    if let cachedImage = cacher.cachedImage(for: imageKey) {
      completion(cachedImage)
      return
    }

    MapPreview.shared.previewImage(lat: Double(item.lat), long: Double(item.long)) { [weak self] image in

      if let image = image {
        self?.cacher.cacheImage(with: image, for: imageKey, completion)
      }
    }
  }
}
