//
//  DetailModels.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 22.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit

enum Detail {

  enum Prepare {

    struct Earthquake {
      let zoneImage: UIImage?
      let zone: String
      let date: String
      let depth: String
      let intensity: String
    }

    struct Request { }

    struct Response {
      let item: List.DataSource
    }

    struct ViewModel {
      let item: List.DataSource
    }
  }
}
