//
//  Model.swift
//  CyclingApp
//
//  Created by lucas urbain on 30.09.22.
//

import Foundation
import SwiftUI
import Alamofire

extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}


struct Comments: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let date_utc: String
    let launchpad: String
    let links: Links

}

struct Launchpad: Codable {
    let name: String
}


struct Booster: Codable {
    let serial: String
    let reuse_count: Int
}


struct Links: Codable {

    let patch: Patch
}

struct Patch: Codable {

    let small: Optional<String>
}



class apiCall: ObservableObject {
    
    @Published var beers: [Comments] = [Comments]()
    
    init () {
        getPreviousLaunches()
        
    }

    func getPreviousLaunches() {
        AF.request("https://api.spacexdata.com/v4/launches/past").response { response in
            self.beers = try! JSONDecoder().decode([Comments].self, from: response.data!).reversed()
        }
    }

    
}

class apiCallPrevious: ObservableObject {
    
    @Published var beers: [Comments] = [Comments]()
    
    init () {
        getUpcomingLaunches()

    }
    

    func getUpcomingLaunches() {
        AF.request("https://api.spacexdata.com/v4/launches/upcoming").response { response in
            self.beers = try! JSONDecoder().decode([Comments].self, from: response.data!)
       
        }
    }
}


class allData: ObservableObject {
    
    @Published var launchpad: [Launchpad] = [Launchpad]()
    
    @Published var booster: [Booster] = [Booster]()
    
    func getLaunchPad(launchpad: String){
        AF.request("https://api.spacexdata.com/v4/launchpads/\(launchpad)").response { response in
            self.launchpad = try! JSONDecoder().decode([Launchpad].self, from: response.data!)
            debugPrint(response)
        }
        
    }
    
    func getBoosterStatus(booster: String){
        AF.request("https://api.spacexdata.com/v4/cores/\(booster)").response { response in
            self.booster = try! JSONDecoder().decode([Booster].self, from: response.data!)
            
        }
    
    }
    
}

