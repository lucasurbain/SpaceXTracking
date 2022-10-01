//
//  DetailsList.swift
//  CyclingApp
//
//  Created by lucas urbain on 30.09.22.
//

import SwiftUI

struct DetailsList: View {
    
    let flight: Comments
    
    @State var comments = [Comments]()
    
    var body: some View {
        VStack {
            Text(flight.name)
        }
    }
}

struct DetailsList_Previews: PreviewProvider {
    static var previews: some View {
        DetailsList(flight: Comments(name: "Starlink V2"))
    }
}
