//
//  EarthQuakeServices.swift
//  Networking
//
//  Created by Emre Çiftçi on 15.06.2019.
//  Copyright © 2019 Emre Çiftçi. All rights reserved.
//

import Foundation

public enum EarthQuakeService: ServiceProtocol {

  case getList

  public var baseURL: URL {
    return URL(string: "https://emrcftci.github.io/demo.github.io")!
  }

  public var path: String {
    return "/dummy.json"
  }

  public var method: HTTPMethod {
    return .get
  }

  public var task: Task {
    return .requestPlain
  }

  public var headers: Headers? {
    return nil
  }

  public var parametersEncoding: ParametersEncoding {
    return .url
  }
}
