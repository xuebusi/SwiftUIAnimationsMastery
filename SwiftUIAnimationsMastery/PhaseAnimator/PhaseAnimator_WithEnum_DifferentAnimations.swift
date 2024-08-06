// Copyright © 2023 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

struct PhaseAnimator_WithEnum_DifferentAnimations: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 60) {
            Button {
                change.toggle()
            } label: {
                Image(systemName: "dollarsign.circle")
                    .padding(4)
                    .frame(maxWidth: .infinity)
            }
            .phaseAnimator(Phases.allCases, trigger: change) { content, phase in
                content
                    .rotationEffect(phase.rotation)
                    .foregroundStyle(change ? Color.primary : Color.blue)
                    .background(change ? .green :  Color.clear, in: Circle())
                    .scaleEffect(phase.scale)
            } animation: { phase in
                switch phase {
                case .step1, .step3: .snappy(duration: 0.8)
                case .step2: .bouncy(extraBounce: 0.3)
                }
            }
        }
        .font(.system(size: 100))
    }
}

#Preview {
    PhaseAnimator_WithEnum_DifferentAnimations()
}
