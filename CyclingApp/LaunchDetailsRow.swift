//
//  LaunchDetailsRow.swift
//  CyclingApp
//
//  Created by lucas urbain on 30.09.22.
//

import SwiftUI

struct LaunchDetailsRow: View {
    let flight: Comments

    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: flight.links.patch.small ?? "spacex.jpg")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
       
            VStack(alignment: .leading,spacing: 6) {
                // MARK: Transaction Merchant
                Text(flight.name)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: Transaction Category
                
                    Text("Falcon 9 | Block 5")
                        .font(.footnote)
                        .opacity(0.7)
                        .lineLimit(1)
            }
            Spacer()
        }
        .padding([.top, .bottom], 8)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LaunchDetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailsRow(flight: Comments(name: "Starlink V2", date_utc: "2022/12/02", launchpad: "KSC LC 39A", links: Links(patch: Patch(small: "https://images2.imgbox.com/eb/d8/D1Yywp0w_o.png"))))
    }
}
