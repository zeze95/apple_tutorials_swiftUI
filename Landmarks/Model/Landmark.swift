//
//  Landmark.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import Foundation
import SwiftUI
import CoreLocation // mapkit과 상호작용 할수 있는 속성 계산 용 

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
        var image: Image {
            Image(imageName)
        }
    private var coordinates : Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
           CLLocationCoordinate2D(
               latitude: coordinates.latitude,
               longitude: coordinates.longitude)
       }
    
    struct Coordinates : Hashable, Codable {
        var latitude : Double
        var longitude : Double
    }
}
