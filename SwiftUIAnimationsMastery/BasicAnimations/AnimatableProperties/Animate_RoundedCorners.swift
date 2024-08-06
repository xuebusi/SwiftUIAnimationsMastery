//
//  Animate_RoundedCorners.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 9/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_RoundedCorners: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Corner Radius")
            BannerText("You provide a value to set the corner radius of a view. The change of this property can be animated.",
                       backColor: .blue, textColor: .white)
            
            Button("Change") {
                change.toggle()
            }
            
            RoundedRectangle(cornerRadius: change ? 0 : 70)
                .foregroundStyle(.blue)
                .padding()
                .animation(.easeInOut, value: change)
            
            Text("You can also animate the cornerRadius modifier")
                .foregroundStyle(.white)
                .padding(25)
                .background(Color.blue)
                .cornerRadius(change ? 0 : 70)
                .animation(.easeInOut, value: change)
        }
        .font(.title)
    }
}

struct Animate_RoundedCorners_Previews: PreviewProvider {
    static var previews: some View {
        Animate_RoundedCorners()
    }
}
