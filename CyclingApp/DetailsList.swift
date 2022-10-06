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
    

    var body: some View {
        VStack {
            let string = flight.name
            if(string.contains("Starlink")) {
                Image("starlink.png")
                    .resizable()
                    .frame(width: 200, height: 200)
            }else {
                Image("spacex.jpg")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            Text(flight.name)
                .bold()
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
        
            Text(flight.date_utc)
                .padding(5)
            
            Text(flight.launchpad)
            

            

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    
    }
}

struct DetailsList_Previews: PreviewProvider {
    static var previews: some View {
        DetailsList(flight: Comments(name: "Starlink V2", date_utc: "30/01/2022", launchpad: "KSC LC 39A"))
    }

}
