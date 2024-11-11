//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import SwiftUI

@main // 앱의 진입점을 보여줌
struct LandmarksApp: App {
    var body: some Scene {
        WindowGroup { // WindowGroup는 여러 개의 창을 동시에 띄울 수 있도록 돕는 구조로 하나의 뷰를 관리함
            ContentView() // 컨텐트뷰를 불러옴
        }
    // 두 번째 창을 띄우기 위한 다른 WindowGroup
    // macOS나 iPadOS에서는 여러 창을 띄우는 것이 가능하지만 iOS는 하나의 창만 가능하다
//        WindowGroup {
//            AnotherView() // 두 번째 창에 AnotherView가 표시
//        }
    }
}
