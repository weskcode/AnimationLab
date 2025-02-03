//
//  LessonAnimations.swift
//  AnimationLab
//
//  Created by Wesley Keetch on 1/31/25.
//

import SwiftUI

struct LessonAnimations: View {
  @State var rectangleIsExpanded = false
  
  var body: some View {
    VStack {
      RoundedRectangle(cornerRadius: 10)
        .padding()
        .frame(height: 200)
        .foregroundStyle(rectangleIsExpanded ? .gray : .cyan)
        .offset(x: rectangleIsExpanded ? -350 : 0)
      Button {
        withAnimation(.easeInOut(duration: 3).delay(1)) {
          rectangleIsExpanded.toggle()
        }
      } label: {
        Text("Animate")
      }
    }
  }
}

#Preview {
  LessonAnimations()
}
