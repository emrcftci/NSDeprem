//
//  ListCell.swift
//  UIComp
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import UIKit

public protocol ListCellDataSource: class {

  var zonePreview: UIImage { get set }
  var zone: String { get set }
  var date: String { get set }
  var intensity: String { get set }
}

public class ListCell: UITableViewCell, NibLoadable {

  @IBOutlet private weak var mapImageView: UIImageView!
  @IBOutlet private weak var zoneLabel: UILabel!
  @IBOutlet private weak var dateLabel: UILabel!
  @IBOutlet private weak var intensityLabel: UILabel!

  @IBOutlet private weak var containerView: UIView! {
    didSet {
      containerView.makeAllCornersRounded(8)
      containerView.makeShadow()
    }
  }

  public func configure(with dataSource: ListCellDataSource) {
    mapImageView.image = dataSource.zonePreview
    zoneLabel.text = dataSource.zone
    dateLabel.text = dataSource.date
    intensityLabel.text = dataSource.intensity

    prepareRoundedLabel(intensityLabel)
  }
}

// MARK: - Private UI Helpers

private extension ListCell {

  func prepareRoundedLabel(_ label: UILabel) {
    label.layer.masksToBounds = true
    let radius = label.frame.height / 2
    label.backgroundColor = .red
    label.makeAllCornersRounded(radius)
  }
}
