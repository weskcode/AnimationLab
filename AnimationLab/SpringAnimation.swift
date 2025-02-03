//
//  SpringAnimation.swift
//  AnimationLab
//
//  Created by Wesley Keetch on 1/31/25.
//

import SwiftUI

struct LessonAnimations3: View {
  @State var tapped = true

  var body: some View {
    VStack {
      VStack {
        Text("Spring Animations")
          .foregroundStyle(.white)
          .padding()
      }
      .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.blue))
      .padding()
      .scaleEffect(tapped ? 0 : 1)

      Button(action: {
        withAnimation(.spring(dampingFraction:  0.2)) {
          tapped.toggle()
        }
      }, label: {
        Text("Show Popup")
      })
    }
  }
}

  #Preview {
    LessonAnimations3()
  }
