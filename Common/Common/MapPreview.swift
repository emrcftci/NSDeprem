//
//  MapPreview.swift
//  Common
//
//  Created by Emre Çiftçi on 22.12.2019.
//  Copyright © 2019 emre Çiftçi. All rights reserved.
//

import MapKit

public class MapPreview {

  public static let shared = MapPreview()

  public func previewImage(lat: Double?, long: Double?, _ completion: @escaping ImageCallback) {
    let mapSnapshotOptions = MKMapSnapshotter.Options()

    // Set the region of the map that is rendered.
    guard
      let latCoordinate = CLLocationDegrees(exactly: lat ?? 0.0),
      let longCoordinate = CLLocationDegrees(exactly: long ?? 0.0) else { return }

    let location = CLLocationCoordinate2DMake(latCoordinate,
                                              longCoordinate)

    let region = MKCoordinateRegion(center: location, latitudinalMeters: 100000, longitudinalMeters: 100000)
    mapSnapshotOptions.region = region

    // Set the scale of the image. We'll just use the scale of the current device, which is 2x scale on Retina screens.
    mapSnapshotOptions.scale = UIScreen.main.scale

    // Set the size of the image output.
    mapSnapshotOptions.size = CGSize(width: 300, height: 300)

    let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)

    snapShotter.start { snapshot, _ in
      completion(snapshot?.image)
    }
  }
}
