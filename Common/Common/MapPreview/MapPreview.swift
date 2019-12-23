//
//  MapPreview.swift
//  Common
//
//  Created by Emre Çiftçi on 22.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import Foundation
import MapKit

public class MapPreview {

  public static let shared = MapPreview()

  public func previewImage(lat: Double?, long: Double?, _ completion: @escaping ImageCallback) {

    guard
      let latCoordinate = CLLocationDegrees(exactly: lat ?? 0.0),
      let longCoordinate = CLLocationDegrees(exactly: long ?? 0.0) else { return }

    let mapSnapshotOptions = MKMapSnapshotter.Options()
    let location = CLLocationCoordinate2DMake(latCoordinate,
                                              longCoordinate)
    let region = MKCoordinateRegion(center: location, latitudinalMeters: 100000, longitudinalMeters: 100000)

    mapSnapshotOptions.region = region
    mapSnapshotOptions.scale = UIScreen.main.scale
    mapSnapshotOptions.size = CGSize(width: 300, height: 300)

    let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)

    snapShotter.start { snapshot, _ in

      let image = UIGraphicsImageRenderer(size: mapSnapshotOptions.size).image { _ in
        snapshot?.image.draw(at: .zero)

        let annotation = MKPinAnnotationView()
        annotation.image = #imageLiteral(resourceName: "earthquake-pin")

        if let annotationImage = annotation.image, let point = snapshot?.point(for: location) {

          let fixedPinPoint = CGPoint(x: point.x - annotationImage.size.width / 2, y: point.y - annotationImage.size.height)
          annotationImage.draw(at: fixedPinPoint)
        }
      }
      completion(image)
    }
  }
}
