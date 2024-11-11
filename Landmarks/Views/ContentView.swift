//
//  ContentView.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//      VStack(alignment: .center, spacing: 10) {
//       컬럼 배열해주는 것 ,alignment 은 정렬 방식,
//       spacing은 뷰들 간의 간격을 설정
        VStack {
            MapView().frame(height: 300)
            CircleImage().offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading){
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
                Text("Turtle Rock")
                    .font(.title)
                    .foregroundStyle(.blue)
                HStack {
                    Text("Josua Tree National Park")
                    Spacer()
                    Text("california")
                        
                }.font(.subheadline).foregroundStyle(.secondary)
                Divider()
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here")
                
            }
            .padding()
            Spacer()
        }
        // .padding(10) // 10 포인트의 여백을 전체 뷰에 적용
        // .frame(width: 200, height: 100) 사이즈 지정
        // .background(Color.blue) // 배경색을 파란색으로 설정
        //.cornerRadius(10) // 모서리 둥글게
        //.shadow(radius: 5) // 그림자 추가
        // 원하는 modifier 여러개 설정 가능
    }
}
// 여백 등에 10을 두게 되면 이건 반응형이아니라 고정 사이즈
#Preview {
    ContentView()
}