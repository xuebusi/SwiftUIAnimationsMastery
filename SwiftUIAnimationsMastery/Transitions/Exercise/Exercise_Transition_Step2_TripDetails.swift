//  Created by Mark Moeykens on 12/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TripDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Destination:")
                .foregroundStyle(Color("Foreground3"))
            Button(action: {}) {
                Text("Select")
                Spacer()
                Image(systemName: "chevron.right")
            }
            Text("Departure:")
                .foregroundStyle(Color("Foreground3"))
                .padding(.top)
            Button(action: {}) {
                Text("Today")
                Spacer()
                Image(systemName: "chevron.right")
            }
            Text("Return:")
                .foregroundStyle(Color("Foreground3"))
                .padding(.top)
            Button(action: {}) {
                Text("Tomorrow")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .padding(25)
        .background(RoundedRectangle(cornerRadius: 10)
        .foregroundStyle(Color("Secondary3")))
        .padding(40)
        .font(.body)
    }
}

struct TripDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailsView()
    }
}
