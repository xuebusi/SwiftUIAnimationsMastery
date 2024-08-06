// Copyright © 2023 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

struct WithAnimation_CompletionCriteria: View {
    @State private var change1 = false
    @State private var color1 = Color.green
    @State private var change2 = false
    @State private var color2 = Color.green
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(color1)
                .frame(height: 100)
                .frame(maxWidth: .infinity, alignment: change1 ? .trailing : .leading)
            
            Circle()
                .fill(color2)
                .frame(height: 100)
                .frame(maxWidth: .infinity, alignment: change2 ? .trailing : .leading)
            
            Button("Change") {
                withAnimation(.spring(bounce: 0.6), completionCriteria: .logicallyComplete) {
                    change1.toggle()
                } completion: {
                    color1 = .red
                }
                
                withAnimation(.spring(bounce: 0.6), completionCriteria: .removed) {
                    change2.toggle()
                } completion: {
                    color2 = .red
                }
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    WithAnimation_CompletionCriteria()
}
