//
//  ProfileHost.swift
//  Landmarks
//
//  Created by zeze kim on 11/12/24.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode // 수정하기 위한 모드 설정
    @Environment(ModelData.self) var modelData // 프로필 데이터를 가져와 현 파일에 전달하기 위해
    @State private var draftProfile = Profile.default // 디폴트를 넣었기에 정적 동적 모두 바인딩 가능함
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active { //취소버튼을 추가함 에딧 모드에서만 보임
                                   Button("Cancel", role: .cancel) {
                                       draftProfile = modelData.profile
                                       editMode?.animation().wrappedValue = .inactive
                                   }
                               }
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: draftProfile)
            } else {
                ProfileEditor(profile: $draftProfile)
                .onAppear {
                    draftProfile = modelData.profile
                }
                .onDisappear {
                    modelData.profile = draftProfile
                } // 생겼을때 없어졌을때 동작할 내용들
            }
        }
        .padding()
    }
}


#Preview {
    ProfileHost().environment(ModelData())
}
