//
//  Landmark.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import Foundation
import SwiftUI
import CoreLocation // mapkit과 상호작용 할수 있는 속성 계산 용 

struct Landmark: Hashable, Codable, Identifiable { //Identifiable 객체를 고유하게 식별할 수 있도록 하는 프로토콜로 id 라는 고유 값을 제공해야함
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite : Bool // 좋아요 한것을 저장하는
    var isFeatured: Bool // 추천 여부
    
    
    var category: Category
        enum Category: String, CaseIterable, Codable { // CaseIterable 케이스들을 쉽게 다루기 위해 존재하는 프로토콜 Codable은 인코딩디코딩
            case lakes = "Lakes"
            case rivers = "Rivers"
            case mountains = "Mountains"
        }
    
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
