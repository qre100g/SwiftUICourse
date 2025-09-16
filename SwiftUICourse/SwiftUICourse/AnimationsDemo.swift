//
//  AnimationsDemo.swift
//  SwiftUICourse
//
//  Created by Mukesh Nagi Reddy on 15/09/25.
//

import SwiftUI

struct AnimationsDemo: View {
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Implicit Animation") { ImplicitAnimation() }
                NavigationLink("Animating Bindings") { AnimatingBindings() }
                NavigationLink("Explict Animation") { ExplicitAnimation() }
                NavigationLink("Animation Stack") { AnimationStack() }
                
            }
            .navigationTitle("Animations")
            
        }
    }
}

struct ImplicitAnimation: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap me") {}
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay {
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        }
        .onAppear {
            animationAmount = 2
        }
    }
}

struct AnimatingBindings: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper("Scale amount",value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 0...10)
                .padding(.vertical, 30)
                .padding(.horizontal, 10)
            
            Spacer()
            
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}

struct ExplicitAnimation: View {
    
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap me") {
            withAnimation {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct AnimationStack: View {
    
    @State private var enabled = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(nil, value: enabled)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.default, value: enabled)
        }
    }
}

#Preview {
    AnimationsDemo()
}
