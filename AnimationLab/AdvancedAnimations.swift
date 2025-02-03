//
//  AdvancedAnimations.swift
//  AnimationLab
//
//  Created by Wesley Keetch on 1/31/25.
//

import SwiftUI

struct LessonAnimations2: View {
    @State var animateFirst = false
    @State var animateSecond = false
    @State var animateThird = false

    var body: some View {
        VStack {
            VStack {
                Text("Header")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.blue))
            .padding()
            .scaleEffect(animateFirst ? 1 : 0)
            HStack {
                Text("Element 1")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.cyan))
                    .scaleEffect(animateSecond ? 1 : 0)
                Text("Element 2")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.green))
                    .scaleEffect(animateThird ? 1 : 0)
            }
            .padding(.horizontal)
            .frame(maxHeight: 200)
            Spacer()

        }
        .onAppear {
            if #available(iOS 17.0, *) {
                withAnimation(.interpolatingSpring(mass: 3, stiffness: 50, damping: 10, initialVelocity: 10).speed(5).delay(0.3)) {
                    animateFirst.toggle()
                } completion: {
                    withAnimation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 8, initialVelocity: 5).speed(5)) {
                        animateSecond.toggle()
                    } completion: {
                        withAnimation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 8, initialVelocity: 5).speed(5)) {
                            animateThird.toggle()
                        }
                    }
                }
            } else {
                // Fallback on earlier versions
            }


        }
    }
}

#Preview {
  LessonAnimations2()
}
