//
//  CategoryHome.swift
//  Landmarks
//
//  Created by zeze kim on 11/12/24.
//

import SwiftUI

struct CategoryHome: View {
    
    @Environment(ModelData.self) var modelData
    //  SwiftUI에서 환경 값을 가져오는 속성 래퍼(가로모드나 다크모드 같은 것 하지만 Observable이랑 함께 쓰면 클래스를 가져올수 있음
    @State private var showingProfile = false
    var body: some View {
        NavigationSplitView { // 목록을 왼쪽에 표시, 선택된 항목에 대한 자세한 정보를 오른쪽에 표시
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets()) // 디스플레이 가장자리까지 콘텐츠보이게
                // 추천 항목 보이게
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: { // 오른쪽 영역
            Text("Select")
        }
    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
