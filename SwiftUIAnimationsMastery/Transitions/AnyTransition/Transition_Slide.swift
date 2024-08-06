//
//  Transition_Slide.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Transition_Slide: View {
    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""
    
    let xOffset: CGFloat = -200
    let showLoginDuration: Double = 0.7
    let delay = 0.5
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Transitions")
                    .foregroundStyle(Color("DarkAccent2"))
                    .font(Font.custom("DIN Condensed Bold", size: 70))
                Text("Slide").foregroundStyle(.gray)
                
                Spacer()
                
                if showLogin {
                    VStack(spacing: 30) {
                        Image(systemName: "lock.shield")
                            .font(.system(size: 70))
                            .padding()
                            .foregroundStyle(Color("Gold"))
                        TextField("Username", text: $userName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Login", action: { }).foregroundStyle(Color("Accent2"))
                    }
                    .padding(.horizontal)
                    .transition(.slide)
                }
                
                Spacer()
                Spacer()
            }
            .animation(.easeOut(duration: showLoginDuration), value: showLogin)
            .font(.title)
            .onAppear {
                showLogin = true
            }
        }
    }
}

struct Transition_Slide_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Slide()
    }
}
