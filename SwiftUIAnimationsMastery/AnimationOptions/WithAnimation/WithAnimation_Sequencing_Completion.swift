// Copyright © 2023 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

struct WithAnimation_Sequencing_Completion: View {
    @State private var expandMoreInfo = false
    @State private var showInfo = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("With Animation")
            SubtitleText("Sequencing using Completion")
            BannerText("You can also trigger the next animation using a completion on the withAnimation function.", backColor: .yellow, textColor: .black)
            
            GeometryReader { gp in
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "info.circle").padding(.horizontal)
                        Text("Login Help")
                        Spacer()
                    }.padding(.top)
                    
                    VStack(spacing: 10) {
                        Image(systemName: "slider.horizontal.3").font(.largeTitle)
                        Text("Appear after parent is done animating out.")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).opacity(0.1))
                    .padding(.horizontal)
                    .opacity(showInfo ? 1 : 0)
                }
                .padding(.trailing, 12)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.yellow).shadow(radius: 8))
                .foregroundStyle(.black)
                .offset(x: expandMoreInfo ? 15 : (gp.frame(in: .global).width - 65),
                        y: expandMoreInfo ? 15 : (gp.frame(in: .global).height - 65))
                .onTapGesture {
                    withAnimation {
                        // Animation 1 on Parent
                        expandMoreInfo.toggle()
                    } completion: {
                        withAnimation {
                            // Animation 2 on Children
                            showInfo.toggle()
                        }
                    }

                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .font(.title)
    }
}

#Preview {
    WithAnimation_Sequencing_Completion()
}
