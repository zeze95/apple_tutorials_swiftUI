//
//  MapView.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate : CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region))) // 값이 변경 될때 업데이트 되도록 위치 입력을 받는 맵의 초기화 프로그램 변경
    }
    private var region : MKCoordinateRegion {
        MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            center : coordinate, // 뷰에 대한 입력이 변경 되면 다시 뷰를 업데이트하기 위해
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
   MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
