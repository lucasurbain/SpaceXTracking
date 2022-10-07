//
//  DetailsList.swift
//  CyclingApp
//
//  Created by lucas urbain on 30.09.22.
//

import SwiftUI
import Foundation

struct DetailsList: View {
    
    let flight: Comments
    
    @State var comments = [Comments]()
    
    @State private var selectedDate = Date()
    
    let notify = NotificationHandler()
    
    var body: some View {
            VStack {
                AsyncImage(url: URL(string: flight.links.patch.small ?? "spacex.jpg")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .padding([.bottom], 20)
                
                Text(flight.name)
                    .bold()
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
            
                Text("KSC | CCSFS")
         
                Button("Click Me") {
                    notify.askPermission()
                    
                    let body = "Watch falcon-9 lift " + flight.name + " in orbit! Launch scheduled for" + flight.date_utc
                    
                    notify.sendNotification(date: Date(), type: "time", timeInterval: 5, title: flight.name, body: body)
                }
                .padding(20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
    }
}

struct DetailsList_Previews: PreviewProvider {
    static var previews: some View {
        DetailsList(flight: Comments(name: "Starlink V2", date_utc: "2022-12-06T23:07:00.000Z", launchpad: "5e9e4502f509094188566f88", links: Links(patch: Patch(small: "https://images2.imgbox.com/eb/d8/D1Yywp0w_o.png"))))
    }
}

extension Date {
    var displayFormat: String {
        self.formatted(date: .numeric, time: .omitted)
    }
}
