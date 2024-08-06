//
//  Triggers_CheckYourUnderstanding1.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Triggers_CheckYourUnderstanding1: View {
    @State private var showView = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Check Your Understanding")
            Button("Show") {
                showView.toggle()
            }
            
            if showView {
                HStack {
                    Image(systemName: "hand.raised")
                    Text("Hello!")
                }
            }
        }
        .font(.title)
        .animation(.default, value: showView)
    }
}

struct Triggers_CheckYourUnderstanding1_Previews: PreviewProvider {
    static var previews: some View {
        Triggers_CheckYourUnderstanding1()
    }
}
