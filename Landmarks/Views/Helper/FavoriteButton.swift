//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet : Bool // @Binding  상위뷰에서 하위뷰로 상태 전달 하는 것 하위에서 상위뷰 컨트롤 가능하게 함 양방향 바인딩 용
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
