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


class apiCallLaunchPad {
    
    @Published var launchpad: [Launchpad] = [Launchpad]()
    

    
    func getLaunchPad(launchpad: String) -> Request {
        let r = AF.request("https://api.spacexdata.com/v4/launchpads/5e9e4502f509094188566f88").response { response in
            self.launchpad = try! JSONDecoder().decode([Launchpad].self, from: response.data!)
            
        }
        
        return r
    }
    
}
