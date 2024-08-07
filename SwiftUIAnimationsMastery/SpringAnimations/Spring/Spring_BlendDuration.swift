//  Created by Mark Moeykens on 9/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Spring_BlendDuration: View {
    @State private var change = false
    @State private var response = 2.0
    @State private var blendDuration = 1.0
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                TitleText("Spring").foregroundStyle(Color("Gold"))
                SubtitleText("Blend Duration")
                BannerText("Blend duration is the number of seconds in which to calculate the differences in changes (within the response's duration).",
                           backColor: Color("Gold"))
                
                Circle()
                    .scaleEffect(change ? 0.2 : 1)
                    .animation(.spring(response: response, dampingFraction: 0.5, blendDuration: blendDuration), value: change)
                
                Text("Response").padding(.top)
                HStack {
                    Image(systemName: "1.circle.fill")
                    Slider(value: $response, in: 1...2)
                    Image(systemName: "2.circle.fill")
                }
                
                Text("Blend Duration")
                HStack {
                    Image(systemName: "0.circle.fill")
                    Slider(value: $blendDuration, in: 0...2)
                    Image(systemName: "2.circle.fill")
                }
                
                Button("Change") {
                    change.toggle()
                }
                .foregroundStyle(Color("Accent"))
            }
            .font(.title)
            .foregroundStyle(Color("Gold"))
            .padding(.horizontal)
        }
    }
}

struct Spring_BlendDuration_Previews: PreviewProvider {
    static var previews: some View {
        Spring_BlendDuration()
    }
}
