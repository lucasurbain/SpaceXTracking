//
//  PastList.swift
//  CyclingApp
//
//  Created by lucas urbain on 30.09.22.
//

import SwiftUI

struct PastList: View {
    
    @State var comments = [Comments]()
    
    @ObservedObject private var dataModel = apiCall()
    
    var body: some View {
        VStack {
            List(dataModel.beers) { comment in
                NavigationLink(destination: DetailsList(flight: comment)) {
                    LaunchDetailsRow(flight: Comments(name: comment.name))
                        .padding([.top, .bottom],2)
       
                }
             
            }
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
            .onAppear {
                apiCall().getPreviousLaunches()
            }
           
        }
        .frame(maxWidth: .infinity)
    }
}

struct PastList_Previews: PreviewProvider {
    static var previews: some View {
        PastList()
            .background(Color.background)
    
    }
}
