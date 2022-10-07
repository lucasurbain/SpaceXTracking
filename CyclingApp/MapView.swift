//
//  MapView.swift
//  CyclingApp
//
//  Created by lucas urbain on 06.10.22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var hideStatusBar = false
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.997053, longitude: -97.155281), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    private let places = [
        PointOfInterest(name: "Starbase.jpg", latitude: 25.997053, longitude:  -97.155281),
        PointOfInterest(name: "VSFB.jpg", latitude: 34.6321464, longitude:  -120.6106383),
        PointOfInterest(name: "KSC.jpg", latitude: 28.6081646, longitude:  -80.6041806),
        PointOfInterest(name: "CCSFS.jpg", latitude: 28.5619233, longitude:  -80.5772026),
        PointOfInterest(name: "McGregor.jpg", latitude: 31.3983109, longitude:  -97.4631862),
        PointOfInterest(name: "SpaceXHQ.jpg", latitude: 33.9204951, longitude:  -118.3275655),
        PointOfInterest(name: "StarlinkFactory.jpg", latitude: 47.6930950, longitude:  -122.0353784),
    ]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places) { place in
            MapMarker(coordinate: place.coordinate)
        }
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
