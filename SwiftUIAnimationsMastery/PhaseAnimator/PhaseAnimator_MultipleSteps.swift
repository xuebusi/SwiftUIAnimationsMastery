// Copyright © 2023 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

struct PhaseAnimator_MultipleSteps: View {
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
            .phaseAnimator(["step1", "step2", "step3"], trigger: change) { content, phase in
                content
                    .rotationEffect(phase == "step1" || phase == "step3" 
                                    ? .zero : Angle.degrees(180))
                    .foregroundStyle(change ? Color.primary : Color.blue)
                    .background(change ? .green :  Color.clear, in: Circle())
                    .scaleEffect(phase == "step2" || phase == "step3" ? 2 : 1)
            }
        }
        .font(.system(size: 100))
    }
}

#Preview {
    PhaseAnimator_MultipleSteps()
}
