//
//  DetailController.swift
//  NSDeprem
//
//  Created by Emre Çiftçi on 22.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: class {

  func displayView(viewModel: Detail.Prepare.ViewModel)
}

final class DetailController: UIViewController {

  var interactor: DetailBusinessLogic?
  var router: (DetailRoutingLogic & DetailDataPassing)?

  // MARK: - Outlets

  @IBOutlet private weak var zonePreviewImageView: UIImageView!
  @IBOutlet private weak var zoneLabel: UILabel!
  @IBOutlet private weak var dateLabel: UILabel!
  @IBOutlet private weak var depthLabel: UILabel!
  @IBOutlet private weak var intensityLabel: UILabel!
  @IBOutlet private weak var footerView: UIView! {
    didSet {
      footerView.makeTopCornersRounded(8)
      footerView.addShadow(.top)
    }
  }

  // MARK: Object lifecycle

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: Setup

  private func setup() {
    let viewController = self
    let interactor = DetailInteractor()
    let presenter = DetailPresenter()
    let worker = DetailWorker()
    let router = DetailRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.worker = worker
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }

  // MARK: - View's lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    interactor?.prepareView()
  }

  // MARK: - Actions

  @IBAction private func didTapClose(_ sender: UIButton) {
    router?.dismiss()
  }
}

extension DetailController: DetailDisplayLogic {

  func displayView(viewModel: Detail.Prepare.ViewModel) {
    let item = viewModel.item

    zonePreviewImageView.image = item.zonePreview
    zoneLabel.text = item.zone
    dateLabel.text = item.date
    depthLabel.text = item.depth
    intensityLabel.text = item.intensity
  }
}
