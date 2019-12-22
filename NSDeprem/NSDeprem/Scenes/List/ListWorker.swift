//
//  ListWorker.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Networking

final public class ListWorker {

  private let sessionProvider = URLSessionProvider()

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
}
