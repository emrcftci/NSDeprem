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
import MapKit

protocol ListDisplayLogic: class {

  func displayList(viewModel: List.Fetch.ViewModel)
  func displayDetail()
}

final class ListController: UIViewController {

  var interactor: ListBusinessLogic?
  var router: (ListRoutingLogic & ListDataPassing)?

  private let refreshControl = UIRefreshControl()

  private var dataSource: List.Fetch.ViewModel?

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
    prepareRefreshControl()
    fetchList()
  }

  private func prepareTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(ListCell.defaultNib, forCellReuseIdentifier: Constants.Identifiers.listCell.rawValue)
    tableView.tableFooterView = UIView()

    if #available(iOS 10.0, *) {
        tableView.refreshControl = refreshControl
    }
    else {
        tableView.addSubview(refreshControl)
    }
  }

  private func fetchList() {
    interactor?.fetchList()
  }

  // MARK: - Refresh Control

  private func prepareRefreshControl() {
      refreshControl.addTarget(self, action: #selector(didRefreshControlValueChanged(_:)), for: .valueChanged)
  }

  @objc private func didRefreshControlValueChanged(_ sender: Any) {
      fetchList()
  }
}

// MARK: - ListDisplayLogic

extension ListController: ListDisplayLogic {

  func displayList(viewModel: List.Fetch.ViewModel) {
    safeSync {
      self.dataSource = viewModel
      self.tableView.reloadData()
      self.refreshControl.endRefreshing()
    }
  }

  func displayDetail() {
    router?.routeToDetail()
  }
}

// MARK: - UITableViewDataSource

extension ListController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource?.earthquakes.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
      let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.listCell.rawValue) as? ListCell
      else { return UITableViewCell() }

    if let earthquake = dataSource?.earthquakes[indexPath.row] {
      cell.configure(with: earthquake)
    }

    return cell
  }

}

// MARK: - UITableViewDelegate

extension ListController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let selectedCell = tableView.cellForRow(at: indexPath) as? ListCell
    interactor?.selectItem(at: indexPath.row, with: selectedCell?.zonePreview())
  }
}
