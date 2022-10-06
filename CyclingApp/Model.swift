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


struct Comments: Codable, Identifiable {
    let id = UUID()
    let name: String
    let date_utc: String

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
