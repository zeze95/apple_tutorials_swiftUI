//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by zeze kim on 11/12/24.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile : Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                Divider()
                
                
                VStack(alignment: .leading) { // 뱃지와 받기위한 조건들을 입력
                    Text("Completed Badges")
                        .font(.headline)
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()


                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)


                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }}
#Preview {
    ProfileSummary(profile: Profile.default).environment(ModelData())
}
