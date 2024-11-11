//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark : Landmark
    // landmark 파일에 선언한 구조체
    // 1. var landmark : Landmark 라고 인스턴스를 넣지 않은 상태에서는 미리보기가 생성되지 않음
    
    var body: some View {
        HStack {
            landmark.image.resizable().frame(width: 50,height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite{
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return Group{ // 하나의 화면에 두개의 구조체가 나올수 있게 수정
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

//#Preview("Turtle Rock") {
//    LandmarkRow(landmark: landmarks[0])
//    // 2. modelData에서 가져온 landmarkData.json의 데이터가 landmarks 에 들어있어서 들어옴 인스턴스로 들어갈수 있음
//    // 3 .이제 미리보기 화면 화면이 보임
//}
//#Preview("Salmon") { // 프리뷰 추가하면 번갈아가며 확인 가능 ("") 사이드뷰 이름 설정 가능
//    LandmarkRow(landmark: landmarks[1])
//}
