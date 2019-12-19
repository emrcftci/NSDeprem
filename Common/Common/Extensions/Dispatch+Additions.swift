//
//  Dispatch+Additions.swift
//  Common
//
//  Created by Emre Çiftçi on 19.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Foundation

public func safeSync(execute: VoidCallback) {
  if Thread.isMainThread {
    execute()
  }
  else {
    DispatchQueue.main.sync(execute: execute)
  }
}
