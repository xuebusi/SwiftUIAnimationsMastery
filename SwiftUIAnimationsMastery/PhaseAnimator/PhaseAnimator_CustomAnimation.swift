// Copyright © 2023 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

struct PhaseAnimator_CustomAnimation: View {
    var body: some View {
        Label("Light Disconnected", systemImage: "exclamationmark.warninglight.fill")
            .phaseAnimator([false, true]) { content, phase in
                content
                    .foregroundStyle(phase ? .orange : .primary)
                    .scaleEffect(phase ? 1.2 : 1)
            } animation: { phase in
                    .easeOut(duration: 1.4)
            }
            .font(.title)
    }
}

#Preview {
    PhaseAnimator_CustomAnimation()
}
