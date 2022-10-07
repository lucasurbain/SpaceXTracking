//
//  UpcomingView.swift
//  CyclingApp
//
//  Created by lucas urbain on 06.10.22.
//

import SwiftUI
import WidgetKit

struct UpcomingView: View {
    
    @State private var selection = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
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

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
