//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by zeze kim on 11/12/24.
//

import SwiftUI


struct ProfileEditor: View {
    @Binding var profile: Profile
    var dateRange: ClosedRange<Date> {
            let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
            let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
            return min...max
        }
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                            Text("Goal Date")
                        }
        }.listStyle(PlainListStyle()) // 색깔 거슬려서 지워버리기
    }
}


#Preview {
    ProfileEditor(profile: .constant(.default))
}
