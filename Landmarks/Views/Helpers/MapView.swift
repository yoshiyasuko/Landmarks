//
//  MapView.swift
//  Landmarks
//
//  Created by Yoshiyasu KO on 2023/01/29.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
//    func makeUIView(context: Context) -> MKMapView {
//        MKMapView(frame: .zero)
//    }
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        let coordinate = CLLocationCoordinate2D(
//            latitude: 34.011286,
//            longitude: -116.166868
//        )
//        let span = MKCoordinateSpan(
//            latitudeDelta: 2.0,
//            longitudeDelta: 2.0
//        )
//        let region = MKCoordinateRegion(center: coordinate, span: span)
//        uiView.setRegion(region, animated: true)
//    }
}

struct MapView_Previews: PreviewProvider {
    static var landmarkData = ModelData().landmarkData
    
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
