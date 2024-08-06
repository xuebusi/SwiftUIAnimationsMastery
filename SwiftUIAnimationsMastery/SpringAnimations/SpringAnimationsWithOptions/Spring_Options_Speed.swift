//  Created by Mark Moeykens on 12/8/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Spring_Options_Speed: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Spring Options")
                    .foregroundStyle(Color("Gold"))
                SubtitleText("Speed")
                BannerText("Use the speed multiplier to adjust the spring animation's speed.",
                           backColor: Color("Gold"))
                
                Button("Start") {
                    change.toggle()
                }
                .foregroundStyle(Color("Accent"))
                
                Text("No speed modifier")
                Circle()
                    .fill(Color("Gold"))
                    .frame(height: 70)
                    .offset(x: change ? 170 : -170)
                    .animation(.spring(response: 2, dampingFraction: 0.6)
                                .repeatCount(2, autoreverses: false), value: change)
                Text("2X Faster").italic()
                Circle()
                    .fill(Color("Gold"))
                    .frame(height: 70)
                    .offset(x: change ? 170 : -170)
                    .animation(.spring(response: 2, dampingFraction: 0.6)
                                .speed(2), // Make twice as fast
                               value: change)
                Text("Half Slower")
                Circle()
                    .fill(Color("Gold"))
                    .frame(height: 70)
                    .offset(x: change ? 170 : -170)
                    .animation(.spring(response: 2, dampingFraction: 0.6)
                                .speed(0.5), // Make half slower
                               value: change)
            }
            .font(.title)
            .foregroundStyle(Color("Gold"))
        }
    }
}

struct Spring_Options_Speed_Previews: PreviewProvider {
    static var previews: some View {
        Spring_Options_Speed()
    }
}
