//
//  ListInteractor.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Foundation

protocol ListBusinessLogic: class {

}

protocol ListDataStore: class {

}

class ListInteractor: ListBusinessLogic, ListDataStore {

  var presenter: ListPresentationLogic?
  var worker: ListWorker?

}
