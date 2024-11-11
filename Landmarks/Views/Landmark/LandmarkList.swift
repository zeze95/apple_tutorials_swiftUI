//
//  LandmarkList.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData //  SwiftUI에서 환경 값을 가져오는 속성 래퍼(가로모드나 다크모드 같은 것 하지만 Observable이랑 함께 쓰면 클래스를 가져올수 있음
    @State private var showFavoritesOnly = false
    // @State 는 뷰에서 상태를 변경 가능 하게 만들고 상태가 변경 되면 뷰가 다시 렌더링 되도록 하는 것
    var filteredLandmarks: [Landmark] { // 속성 값을 확인해서 필터링시 보여줄 화면을 만듦
        modelData.landmarks.filter { landmark in //modelData를 통해 landmarks 가져옴
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationSplitView {
//            List(filteredLandmarks){ // 배열과 Identifiable filteredLandmarks는 이제 필터링 변경되면 변경되게
//            List(landmarks,id: \.id){ // 라고 id 값을 넣어줘야하지만 랜드마크 구조체에 Identifiable 프로토콜을 받아오기에 id: 를 뺴도 됨
            List{
                Toggle(isOn: $showFavoritesOnly){Text("Favorites Only")}
                ForEach(filteredLandmarks) { // 정적뷰와 동적 뷰를 목록으로 결합하거나 두개이상의 다른 동적 뷰 그룹을 결밯라면 데이터 컬렉션을 전달 하는 대신 type를 사용
                    landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            .animation(.default, value: filteredLandmarks)
        } detail: {
            Text("Select a Landmark")
            //         .listStyle(PlainListStyle())
            //        PlainListStyle(): 구분선과 함께 리스트 나오는 기본스타일
            //        GroupedListStyle(): 그룹화된 스타일로, 아이템들이 그룹으로 묶임
            //        InsetGroupedListStyle(): iOS에서 사용 가능한, 인셋이 적용된 그룹형 스타일
            //        SidebarListStyle(): macOS와 iPadOS에서 사용하는 사이드바 스타일
            //        .frame(width: 300, height: 500) 사이즈 조절
            //        .background(Color.blue)
            //        .padding(10)
            //        .cornerRadius(15)
            //        .shadow(radius: 5)
            //        .onAppear { // 리스트가 나타났을떄 동작하는 것
            //            print("List가 나타났습니다!")
            //        }
            //        .onDisappear { // 리스트가 사라졌을떄 동작하는 것
            //            print("List가 사라졌습니다!")
            //        }
            //        .refreshable { 데이터 새로 고침 동작 } // 리스트를 위로 당겨서 새로고침
            //        .scrollContentBackground(.hidden) // 리스트 배경 hidden으로 투명하게
            //        .scrollIndicators(.hidden) // 스크롤바 숨기기
        }
    }
}

#Preview {
    LandmarkList()
}
