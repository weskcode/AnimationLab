//
//  TapGestureAnimation.swift
//  AnimationLab
//
//  Created by Wesley Keetch on 1/31/25.
//

import SwiftUI

struct TapGestureAnimation: View {
  @State var tapped = false
  @State var red = 0.0
  @State var green = 0.0
  @State var blue = 0.0

  var body: some View {
    Text("Cool Button")
      .foregroundStyle(.white)
      .padding()
      .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color(red: red, green: green, blue: blue)))
      .padding()
      .scaleEffect(tapped ? 0.9 : 1)
      .onTapGesture(count: 2, perform: {
        withAnimation(.easeIn(duration: 0.1)) {
          tapped.toggle()
        }

        withAnimation(.easeOut(duration: 0.1).delay(0.1)) {
          tapped.toggle()
        }

        withAnimation(.easeIn(duration: 0.1)) {
          red = Double.random(in: 0...1)
          blue = Double.random(in: 0...1)
          green = Double.random(in: 0...1)
        }
      })
  }
}

#Preview {
  TapGestureAnimation()
}
