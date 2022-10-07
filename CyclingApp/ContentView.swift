//
//  ContentView.swift
//  CyclingApp
//
//  Created by lucas urbain on 30.09.22.
//

import SwiftUI
import WidgetKit


struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray6
        UITabBar.appearance().barTintColor = UIColor.systemGray6
    }

    
    var body: some View {
        TabView() {
            UpcomingView()
                .tabItem {
                    Label("Missions", systemImage: "binoculars")
                }
              
            OptionsView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            MapView()
                .tabItem {
                    Label("Maps", systemImage: "globe.europe.africa")
                }
        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
 
    }
}
