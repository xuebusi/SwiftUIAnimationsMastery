// Copyright © 2023 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

class AppAnimations {
    static var tightSpring = Spring(response: 0.2, dampingRatio: 0.6)
    static var heavySpring = Spring(mass: 1.0, stiffness: 8, damping: 0.4)
    static var looseSpring = Spring(settlingDuration: 0.8, dampingRatio: 0.6)
}


struct SpringObject_Customization: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Circle()
                    .overlay(Text("tight").foregroundStyle(.white))
                    .animation(.spring(AppAnimations.tightSpring), value: change)
                
                Circle()
                    .overlay(Text("heavy").foregroundStyle(.white))
                    .animation(.spring(AppAnimations.heavySpring), value: change)
                
                Circle()
                    .overlay(Text("loose").foregroundStyle(.white))
                    .animation(.spring(AppAnimations.looseSpring), value: change)
            }
            .foregroundStyle(.gold)
            .frame(height: 100)
            .frame(maxWidth: .infinity, alignment: change ? .trailing : .leading)
            
            Button("Change") {
                change.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .font(.title)
    }
}

#Preview {
    SpringObject_Customization()
}
