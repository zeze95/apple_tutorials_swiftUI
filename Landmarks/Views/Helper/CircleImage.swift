//
//  CircleImage.swift
//  Landmarks
//
//  Created by zeze kim on 11/11/24.
//

import SwiftUI

struct CircleImage: View {
    var imgae : Image
    var body: some View {
//        Image("turtlerock").clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay{ Circle().stroke(.white)}.shadow(radius: 7)
        imgae.clipShape(Circle()).overlay{
            Circle().stroke(.white ,lineWidth: 4)
        }
        .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(imgae: Image("turtlerock"))
}
