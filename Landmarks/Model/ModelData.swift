//
//  ModelData.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import Foundation

@Observable // 클래스의 속성이 자동으로 변화 추적이 가능하고 더 간편하게 업데이트 가능
class ModelData{ // 기본 클래스
    var landmarks: [Landmark] = load("landmarkData.json")
}

//var landmarks: [Landmark] = load("landmarkData.json") // 초기화할 랜드마크 배열

func load<T: Decodable>(_ filename: String) -> T { // load(:) 앱의 번들에서 json 데이터를 가져오는 메서드를 만들기
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
