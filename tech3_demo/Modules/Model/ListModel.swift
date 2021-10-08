//
//  ListModel.swift
//  tech3_demo
//
//  Created by Clorida on 08/10/21.
//

import UIKit

// MARK: - State
struct State {
    var StateName:String?
    var City:[City]
}

// MARK: - City
struct City {
    var CityName:String?
    var Place: [Place]
}

// MARK: - Place
struct Place {
    var PlaceName: String?
}
