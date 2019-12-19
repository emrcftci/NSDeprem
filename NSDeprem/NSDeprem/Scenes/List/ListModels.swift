//
//  ListModels.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit
import UIComp

public enum List {

  public enum FetchList {

    public class ListDataSource: ListCellDataSource {

      public var zone: String
      public var date: String
      public var intensity: String

      public init(earthquake: EarthQuake) {
        self.zone = earthquake.zone
        self.date = "\(earthquake.date) - \(earthquake.time)"
        self.intensity = earthquake.intensity
      }
    }

    public struct EarthQuake: Codable {
      let depth: String
      let zone: String
      let time: String
      let date: String
      let intensity: String
      let lat: String
      let long: String
    }

    public struct Response: Codable {
      let info: String
      let earthquakes: [EarthQuake]
    }

    public struct ViewModel { }
  }
}
