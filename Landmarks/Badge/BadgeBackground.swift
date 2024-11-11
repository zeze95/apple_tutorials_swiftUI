//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in //GeometryReader 뱃지를 사용한 뷰의 크기를 사용가능
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                // CGFloat 그래픽 관련 작업 할떄 쓰는 실수
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(to: CGPoint(x: width * 0.95 + xOffset, y: height * (0.20 + HexagonParameters.adjustment)))
                // path.move(to:)는 Path 객체에서 그리기 시작할 위치를 지정
                // GPoint(x: y:) 두 좌표 (x, y)로 위치를 나타내는 객체
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    ) // 곡선을 무시하던 것을 고침
                }
            } .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }.aspectRatio(1, contentMode: .fit) // 1:1 종횡비유지 그래디언트 채우기
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
    
}

#Preview {
    BadgeBackground()
}
