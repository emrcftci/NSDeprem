//
//  ListCell.swift
//  UIComp
//
//  Created by Emre Çiftçi on 18.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Common
import UIKit
import MapKit

public protocol ListCellDataSource: class {

  var zone: String { get set }
  var date: String { get set }
  var intensity: String { get set }
  var lat: String { get set }
  var long: String { get set }
  var zonePreview: UIImage? { get set }
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

  public override func awakeFromNib() {
    super.awakeFromNib()
    prepareRoundedLabel(intensityLabel)
  }
  
  public override func prepareForReuse() {
    super.prepareForReuse()
    resetAllFields()
  }

  private func resetAllFields() {
    mapImageView.image = nil
    zoneLabel.text = ""
    dateLabel.text = ""
    intensityLabel.text = ""
  }

  public func zonePreview() -> UIImage? {
    return mapImageView.image
  }

  public func configure(with dataSource: ListCellDataSource) {
    zoneLabel.text = dataSource.zone
    dateLabel.text = dataSource.date
    intensityLabel.text = dataSource.intensity

    MapPreview.shared.previewImage(lat: Double(dataSource.lat), long: Double(dataSource.long)) { [weak self] preview in
      self?.mapImageView.image = preview
    }
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
