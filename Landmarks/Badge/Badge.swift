//
//  Badge.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols : some View {
        ForEach(0..<8) { index in
                   RotatedBadgeSymbol(
                       angle: .degrees(Double(index) / Double(8)) * 360.0
                   )
               }
               .opacity(0.5)
               // 심볼을 복사본을 회전하도록 forEach로 돌림
    }
    var body: some View {
        ZStack {
            BadgeBackground()
            GeometryReader {geometry in badgeSymbols.scaleEffect(1.0/4.0, anchor: .top).position(x:geometry.size.width / 2.0 , y:(3.0 / 4.0) * geometry.size.height)}
        }.scaledToFit() // 사이즈가 맞도록
    }
}

#Preview {
    Badge()
}
