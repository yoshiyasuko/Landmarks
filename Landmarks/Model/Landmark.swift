//
//  Landmark.swift
//  Landmarks
//
//  Created by Yoshiyasu KO on 2023/01/29.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    private var imageName: String
    private var coordinates: Coordinates
    var state: String
    var park: String
    var description: String
    var isFavorite: Bool
    
    enum Category: String, CaseIterable, Hashable, Codable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

extension Landmark {
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
