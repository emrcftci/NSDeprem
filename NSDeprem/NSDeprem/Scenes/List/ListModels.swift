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

  public class DataSource: ListCellDataSource {

    public var zone: String
    public var date: String
    public var depth: String
    public var intensity: String
    public var lat: String
    public var long: String
    public var zonePreview: UIImage?

    public init(earthquake: Fetch.EarthQuake, preview: UIImage? = nil) {
      self.zone = earthquake.zone
      self.date = "\(earthquake.date) - \(earthquake.time)"
      self.depth = earthquake.depth
      self.intensity = earthquake.intensity
      self.lat = earthquake.lat
      self.long = earthquake.long
      self.zonePreview = preview
    }
  }

  public enum Fetch {

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
      let earthquakes: [EarthQuake]
    }

    public struct ViewModel {
      let earthquakes: [DataSource]
    }
  }
}
