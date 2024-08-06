// Copyright © 2023 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

enum Phases: CaseIterable {
    case step1
    case step2
    case step3
    
    var rotation: Angle {
        switch self {
        case .step1, .step3: .zero
        case .step2: Angle.degrees(180)
        }
    }
    
    var scale: Double {
        switch self {
        case .step1: 1
        case .step2, .step3: 2
        }
    }
}

struct PhaseAnimator_WithEnum: View {
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
            }
        }
        .font(.system(size: 100))
    }
}

#Preview {
    PhaseAnimator_WithEnum()
}
