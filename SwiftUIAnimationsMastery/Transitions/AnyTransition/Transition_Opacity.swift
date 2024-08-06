//
//  Transition_Opacity.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Transition_Opacity: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundStyle(Color("LightShade2"))
                SubtitleText("Opacity").foregroundStyle(Color("LightAccent2"))
                BannerText("Use opacity to fade a view in and out.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    change.toggle()
                }
                Spacer()
                
                if change {
                    Image("driving")
                        .transition(.opacity.animation(.easeInOut(duration: 1)))
                }
                
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

struct Transition_Opacity_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Opacity()
    }
}
