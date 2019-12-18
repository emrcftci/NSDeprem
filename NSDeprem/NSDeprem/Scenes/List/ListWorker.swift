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
}

// MARK: - Public Helpers

public extension ListWorker {

    func getResources(completion: @escaping () -> Void) {
        sessionProvider.request(type: String.self, service: EarthQuakeService.getList) { response in

            switch response {
            case let .success(sources):
//                completion(sources)

            case .failure(_):
//                completion(nil)
            }

        }
    }
}
