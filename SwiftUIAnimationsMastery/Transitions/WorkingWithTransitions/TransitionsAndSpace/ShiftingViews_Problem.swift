//  Created by Mark Moeykens on 12/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ShiftingViews_Problem: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundStyle(Color("LightShade2"))
                SubtitleText("Shifting Views Problem").foregroundStyle(Color("LightAccent2"))
                BannerText("Transitions work with views that are inserted and removed from the screen (view hierarchy). Insertion and removal will adjust views around them.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    change.toggle()
                }
                
                if change {
                    Image("collaboration")
                        .transition(.slide)
                }
                
                BannerText("Notice what happens when the view is inserted here.",
                           backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
            }
            .animation(.default, value: change)
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

struct ShiftingViews_Problem_Previews: PreviewProvider {
    static var previews: some View {
        ShiftingViews_Problem()
    }
}
