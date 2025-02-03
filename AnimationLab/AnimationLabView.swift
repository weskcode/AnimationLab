//
//  AnimationLabView.swift
//  AnimationLab
//
//  Created by Wesley Keetch on 1/31/25.
//

import SwiftUI

struct AnimationLabView: View {
  @State private var countdownNumber: Int = 3
  @State private var isCountingDown: Bool = false
  @State private var showGo: Bool = false
  @State private var opacity: Double = 0.0
  @State private var scale: CGFloat = 2.0

  var body: some View {
    VStack {
      if isCountingDown {
        if showGo {
          Text("GO!")
            .font(.system(size: 100, weight: .bold, design: .rounded))
            .opacity(1.0)
        } else {
          Text("\(countdownNumber)")
            .font(.system(size: 100, weight: .bold, design: .rounded))
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
              animateIn()
            }
        }
      }

      Button(action: {
        startCountdown()
      }) {
        Text("START GAME")
          .font(.title)
          .padding()
          .background(Color.indigo)
          .foregroundColor(.white)
          .cornerRadius(12)
      }
      .padding()
    }
  }

  func startCountdown() {
    isCountingDown = true
    countdownNumber = 3
    showGo = false
    opacity = 0.0
    scale = 2.0

    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
      if countdownNumber > 0 {
        animateIn()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
          animateOut()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
          countdownNumber -= 1
          if countdownNumber == 0 {
            showGo = true
            timer.invalidate()
          }
        }
      }
    }
  }

  func animateIn() {
    withAnimation(.easeInOut(duration: 0.8)) {
      opacity = 1.0
      scale = 1.0
    }
  }

  func animateOut() {
    withAnimation(.easeOut(duration: 0.2)) {
      opacity = 0.0
    }
  }
}

#Preview {
  AnimationLabView()
}
