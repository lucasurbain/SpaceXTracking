//
//  OptionsView.swift
//  CyclingApp
//
//  Created by lucas urbain on 06.10.22.
//

import SwiftUI

struct Rockets: Codable, Identifiable {
    let id: Int
    let name: String
    let size: String
    let payload: String
    let stage: String
    let engines: String
    let first_flight: String
    let success_mission_number: String
    let cost_per_launch: String
    let reusable: String
    let url: String
}


struct OptionsView: View {
    @State private var index = 0
    
    var data = [
        
        Rockets(id: 1, name: "Falcon 1", size: "22.25m", payload: "450kg", stage: "2", engines: "1", first_flight: "2006-03-24", success_mission_number: "3", cost_per_launch: "6'700'000", reusable: "false", url: "falcon1.jpeg"),
        Rockets(id: 2, name: "Falcon 9", size: "70m", payload: "16.5t", stage: "2", engines: "9", first_flight: "2010-06-04", success_mission_number: "+100", cost_per_launch: "54'000'000", reusable: "true",url: "falcon9.jpg"),
        Rockets(id: 3, name: "Falcon Heavy", size: "70m", payload: "63.8t", stage: "4", engines: "27", first_flight: "2018-02-06", success_mission_number: "3", cost_per_launch: "90'000'000", reusable: "true",url: "falcon_heavy.jpg"),
        Rockets(id: 4, name: "Starship", size: "118m", payload: "+150t", stage: "2", engines: "33", first_flight: "2022-12-02", success_mission_number: "0", cost_per_launch: "+100'000'000", reusable: "true",url: "starship.jpg")
        
    ]
    
    @State private var selection = 0
    
    var body: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            HStack(spacing: 20) {
                Spacer()
                ForEach(data) { item in
         
                    VStack {
                        Image(item.url)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                            .padding(40)
                        
                        Text(item.name)
                            .bold()
                            .font(.system(size: 24))
                            .padding([.bottom],2)
                        
                        Text(item.size + " | " + item.payload)
                            .font(.system(size: 16))
                            .padding([.bottom],2)
                        Text(item.first_flight + " | $" + item.cost_per_launch)
                            .font(.system(size: 16))
                            .padding([.bottom],2)
                        
                        if(item.reusable == "true") {
                            Text("Reusable: "+item.reusable + " ✅")
                                .font(.system(size: 16))
                                .padding([.bottom],50)
                                .foregroundColor(.green)
                        }else {
                            Text("Reusable: "+item.reusable + " ❌")
                                .font(.system(size: 16))
                                .padding([.bottom],50)
                                .foregroundColor(.red)
                        }
                
                    }
                    .background(Color.systemBackground)
                    .padding(20)
      
              
                }
                Spacer()
  
        
                 
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }

}


struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
   
    }
}

