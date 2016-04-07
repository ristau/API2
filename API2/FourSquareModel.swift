//
//  FourSquareModel.swift
//  API2
//
//  Created by Barbara Ristau on 4/6/16.
//  Copyright © 2016 Barbara. All rights reserved.
//

import UIKit
import SwiftyJSON


class FourSquareModel: NSObject {
    
    var venueName: String?
    var id: Int?
    var fullAddress: String?
    var lat: Double?
    var lng: Double?
    var checkinsCount: Int?
    var usersCount: Int?
    
    var venueURL: NSURL?
    
    
    init(jsonData: JSON) {
        
        venueName = jsonData["name"].stringValue
        id = jsonData["id"].intValue
        fullAddress = jsonData["location/formattedAddress"].stringValue
        lat = jsonData["location/lat"].doubleValue
        lng = jsonData["location/lng"].doubleValue
        checkinsCount = jsonData["stats/checkinsCount"].intValue
        usersCount = jsonData["stats/usersCount"].intValue
        
        let urlString = jsonData["url"].stringValue
        venueURL = NSURL(string: urlString)
        
    }
    
    
    class func venueWithArray(array: [NSDictionary]) -> [FourSquareModel] {
       // array.forEach{ print($0.text) }
        return array.map{ FourSquareModel(jsonData: JSON($0)) }
    }
    
}
