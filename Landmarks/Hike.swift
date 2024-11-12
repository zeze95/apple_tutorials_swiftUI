//
//  Hike.swift
//  Landmarks
//
//  Created by zeze kim on 11/12/24.
//

import Foundation


struct Hike : Codable, Hashable, Identifiable {
    // Codable typealias로 JSON이나 다른 형식으로 데이터를 인코딩(encode)하고 디코딩(decode) 하도록함
    // Hashable protocol Set이나 Dictionar같은 곳애서 유일한 값으로 비교하거나 사용
    // Identifiable protocol 고유 식별자를 가지도록 함 ID 속성으로 항목을 구분하도록 함
    
    var id: Int
        var name: String
        var distance: Double
        var difficulty: Int
        var observations: [Observation]


        static var formatter = LengthFormatter()


        var distanceText: String { // 연산 프로퍼티는 distance 값(하이킹 거리)을 문자열 형식으로 변환하여 반환
            Hike.formatter //formatter를 통해 2.5 km같은 형색ㄷ으로 포멧 가능 여기서는 킬로미터
                .string(fromValue: distance, unit: .kilometer)
        }



        struct Observation: Codable, Hashable {
//        Codable은 JSON 등으로 변환가능
//        Hashable은 중복을 제거하거나 비교할 때 사용 가능
            var distanceFromStart: Double
            var elevation: Range<Double>
            var pace: Range<Double>
            var heartRate: Range<Double>
        }
    }
