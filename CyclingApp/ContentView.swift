//
//  ContentView.swift
//  CyclingApp
//
//  Created by lucas urbain on 30.09.22.
//

import SwiftUI

struct ContentView: View {
    

    @State private var selection = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 24) {
                Picker(selection: $selection, label: Text(""), content: {
                    Text("Upcoming 🚀").tag(0)
                    Text("Past 🛰").tag(1)
                }).pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if selection == 0 {
                    UpcomingList()
                
       
                }else {
                    PastList()
             

                }
           
            }

            .frame(maxWidth: .infinity)
            .background(Color.background)
        }

        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
 
    }
}
