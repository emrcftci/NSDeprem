//
//  ListController.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit
import UIComp
import Common

protocol ListDisplayLogic: class {

}

final class ListController: UIViewController {

  var interactor: ListBusinessLogic?
  var router: (ListRoutingLogic & ListDataPassing)?

  // MARK: - Outlets

  @IBOutlet private weak var tableView: UITableView!

  // MARK: - Object lifecycle

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: - Setup

  private func setup() {
    let viewController = self
    let interactor = ListInteractor()
    let presenter = ListPresenter()
    let worker = ListWorker()
    let router = ListRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.worker = worker
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }

  // MARK: - View's Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    prepareTableView()
  }

  private func prepareTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(ListCell.defaultNib, forCellReuseIdentifier: Constants.Identifiers.listCell.rawValue)
    tableView.tableFooterView = UIView()
  }
}

// MARK: - UITableViewDataSource

extension ListController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.listCell.rawValue) as? ListCell
      else { return UITableViewCell() }

    // TODO: Configure with service call
    let dataSource = DataSource()
    dataSource.date = "11/07/1994"
    dataSource.intensity = "2.6"
    dataSource.zone = "Atakoy"
    dataSource.zonePreview = UIImage(named: "sample-preview")!
    cell.configure(with: dataSource)
    return cell
  }

}

// MARK: - UITableViewDelegate

extension ListController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

// MARK: - ListDisplayLogic

extension ListController: ListDisplayLogic {

}

class DataSource: ListCellDataSource {

  var zonePreview: UIImage = UIImage()
  var zone: String = ""
  var date: String = ""
  var intensity: String = ""
}
