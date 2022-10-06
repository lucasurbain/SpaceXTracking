//
//  UpcomingList.swift
//  CyclingApp
//
//  Created by lucas urbain on 30.09.22.
//

import SwiftUI


struct UpcomingList: View {
    
    @State var comments = [Comments]()
    
    @ObservedObject private var dataModel = apiCallPrevious()
    

    var body: some View {
        VStack {
            List(dataModel.beers) { comment in
                NavigationLink(destination: DetailsList(flight: comment)) {
                    LaunchDetailsRow(flight: Comments(name: comment.name, date_utc: comment.date_utc, launchpad: comment.launchpad))
                        .padding([.top, .bottom],2)
                }
         
            }
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
            .onAppear {
                apiCallPrevious().getUpcomingLaunches()
            }
            
       

        }
        .frame(maxWidth: .infinity)


    }

}


struct UpcomingList_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingList()
            .background(Color.background)
    }
}
