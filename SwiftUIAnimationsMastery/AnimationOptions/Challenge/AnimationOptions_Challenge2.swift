//
//  AnimationOptions_Challenge2.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AnimationOptions_Challenge2: View {
    @State private var start = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("CHALLENGE").foregroundStyle(Color("Gold"))
                SubtitleText("Recreate this Animation")
                
                Spacer()
                
                Text("Welcome!")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundStyle(Color("Gold"))
                    .opacity(start ? 1 : 0)
                    .animation(.easeIn(duration: 1).delay(0.5), value: start)
                    .onAppear(perform: { start = true })
                
                Spacer()
                
                GeometryReader { geometry in
                    Button(action: {}) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 80))
                    }
                    .tint(Color("Accent"))
                    .overlay(
                        Circle()
                            .stroke(Color("Gold"), lineWidth: 5)
                            .opacity(start ? 0 : 1)
                            .scaleEffect(start ? 1.8 : 1.3)
                            .animation(.easeOut(duration: 1).repeatCount(5).delay(2), value: start)
                    )
                        .rotationEffect(Angle.degrees(start ? 0 : -270))
                        .offset(x: start ? geometry.size.width : 0)
                        .animation(.easeInOut(duration: 1).delay(1.5), value: start)
                }
                .offset(x: -120)
                .frame(height: 100)
            }
            .font(.title)
        }
    }
}

struct AnimationOptions_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptions_Challenge2()
    }
}
