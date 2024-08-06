//
//  Exercise_AnimationOptions_AnimateTextFieldsButton.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise_AnimationOptions_AnimateTextFieldsButton: View {
    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Exercise").foregroundStyle(Color("Gold"))
                    .font(Font.custom("DIN Condensed Bold", size: 70))
                Text("Show Login").foregroundStyle(.gray)
                Spacer()
                VStack(spacing: 30) {
                    Image(systemName: "lock.shield")
                        .font(.system(size: 70))
                        .padding()
                        .foregroundStyle(Color("Gold"))
                        .scaleEffect(showLogin ? 1 : 4)
                        .animation(.easeIn(duration: 0.5).delay(0.5), value: showLogin)
                    TextField("Username", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(.easeOut(duration: 0.5).delay(0.5), value: showLogin)
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(.easeOut(duration: 0.5).delay(0.5), value: showLogin)
                    Button("Login", action: { })
                        .foregroundStyle(Color("Accent"))
                    
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(.easeOut(duration: 0.5).delay(0.5), value: showLogin)
                }
                .padding(.horizontal)
                .onAppear {
                    showLogin = true
                }
                
                Spacer()
                Spacer()
            }
            .padding(.top)
            .font(.title)
        }
    }
}

struct Exercise_AnimationOptions_AnimateTextFieldsButton_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_AnimationOptions_AnimateTextFieldsButton()
    }
}
