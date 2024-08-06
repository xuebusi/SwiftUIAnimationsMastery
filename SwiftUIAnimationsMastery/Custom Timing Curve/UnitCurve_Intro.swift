// Copyright © 2023 Big Mountain Studio. All rights reserved. Twitter: @BigMtnStudio

import SwiftUI

extension AppAnimations {
   static var customCurve = UnitCurve.bezier(startControlPoint: UnitPoint(x: 0.5, y: -0.5),
                                             endControlPoint: UnitPoint(x: 0.5, y: 1.5))
}

struct UnitCurve_Intro: View {
   @State private var change = false
   
   var body: some View {
      VStack(spacing: 20) {
         Group {
            Circle()
               .overlay(Text("custom").foregroundStyle(.white))
               .animation(.timingCurve(AppAnimations.customCurve, duration: 0.5), value: change)
            
            Circle()
               .overlay(Text("easeIn").foregroundStyle(.white))
               .animation(.timingCurve(UnitCurve.easeIn, duration: 0.5), value: change)
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
   UnitCurve_Intro()
}
