//
//  CategoryRow.swift
//  Landmarks
//
//  Created by zeze kim on 11/12/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items : [Landmark]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink { // 카테고리 항목은 레이블을 붙이고 랜드마크 상세 보기 를 위한 네비게이션 링크
                            LandmarkDetail(landmark: landmark)
                            //사용자가 링크를 클릭했을 때 이동할 화면
                        } label: {
                            CategoryItem(landmark: landmark)
                            //사용자가 클릭할 UI 요소
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}
#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(3))
    )
}
