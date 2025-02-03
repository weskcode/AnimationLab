//
//  ContentView.swift
//  AnimationLab
//
//  Created by Wesley Keetch on 1/31/25.
//

import SwiftUI


@Observable
class ContentViewModel {
    var spinWorldImage = true
    var hideWorld = true

    var degrees: Double {
        if spinWorldImage {
            return 0
        } else {
            return -180
        }
    }
    var worldScale: Double {
        spinWorldImage ? 0.5 : 1.0
    }
}

struct ContentView: View {
    var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .foregroundStyle(.tint)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(viewModel.degrees))
                .scaleEffect(CGSize(width: viewModel.worldScale, height: viewModel.worldScale))
                .opacity(viewModel.hideWorld ? 0.05 : 1.0)
                .onTapGesture {
                    withAnimation(.spring(.bouncy, blendDuration: 1.5)) {
                        viewModel.spinWorldImage.toggle()
                    }
                    withAnimation(.default.speed(0.25)) {
                        viewModel.hideWorld.toggle()
                    }
                }
            ZStack {
                Text("Hello, world!")
                    .offset(x: viewModel.hideWorld ? -300 : 0)
                Text("Goodbye, world!")
                    .offset(x: viewModel.hideWorld ? 0 : 300)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
