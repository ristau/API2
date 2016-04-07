//
//  FourSquareClient.swift
//  API2
//
//  Created by Barbara Ristau on 4/6/16.
//  Copyright © 2016 Barbara. All rights reserved.
//

import UIKit
import AFNetworking
import BDBOAuth1Manager
import SwiftyJSON

typealias ServiceResponse = (JSON, NSError?) -> Void


let fourSquareConsumerKey = "NQ55EOG3LNQ54CG3GGI5QGBO00OGPVOOZ21HSAQXITNEYLAP"
let fourSquareConsumerSecret = "S3EDWKFSATYEWMJXTTCMIYMSWOZGEPHNP0DZU0YYNVU1VIPU"
let latitude = 40.7
let longitude = -74
let date = 20160406

let fourSquareBaseURL = NSURL(string: "https://api.foursquare.com/")


class FourSquareClient: BDBOAuth1SessionManager {

    static let sharedInstance = FourSquareClient()
    
    let myGeocoordinate = "ll=" + String(latitude) + "," + String(longitude)
    
    let myURL = String(fourSquareBaseURL)
    
    // "v2/search?"
    
 let fourSquareFullURL = "https://api.foursquare.com/v2/venues/search?ll=37.75,-122.42&client_id=NQ55EOG3LNQ54CG3GGI5QGBO00OGPVOOZ21HSAQXITNEYLAP&client_secret=S3EDWKFSATYEWMJXTTCMIYMSWOZGEPHNP0DZU0YYNVU1VIPU&v=20160406"
//    
    
   // let fourSquareURL = fourSquareBaseURL + "/search?ll=" + latitude + "," + long
    
    
//    let myURL = foursquareBaseURL + "/search?" + String(anotherModel.geoCoordinates) + String(clientKey) + makeDateString( yourDate )`
    
 
    
    //adapt this to include parameters (geocoordinates, client key & secret, date) 
    
    func fetchNetworkData(onCompletion: (JSON) -> Void) {
        let route = fourSquareFullURL
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }

    
    private func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                let json:JSON = JSON(data: jsonData)
                print("Success fully made network request")
               // print(json) // use this to test if call works successfully
                print(self.myGeocoordinate)
                print(self.myURL)
                
              //  let venues = FourSquareModel.venueWithArray(response as! [NSDictionary])
             //   let venueNames = venues["name"]
               // print(venues)
                
                onCompletion(json, error)
                
            } else {
                onCompletion(nil, error)
                print("Failure")
            }
        })
        task.resume()
    }
    

    
}

/*

Base URL + search? + geo-coordinates + Client ID & Client Secret & Date
https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD


NY City Geo coordinates
https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=NQ55EOG3LNQ54CG3GGI5QGBO00OGPVOOZ21HSAQXITNEYLAP&client_secret=S3EDWKFSATYEWMJXTTCMIYMSWOZGEPHNP0DZU0YYNVU1VIPU&v=20160406


SF Geo Coordinates
https://api.foursquare.com/v2/venues/search?ll=37.75,-122.42&client_id=NQ55EOG3LNQ54CG3GGI5QGBO00OGPVOOZ21HSAQXITNEYLAP&client_secret=S3EDWKFSATYEWMJXTTCMIYMSWOZGEPHNP0DZU0YYNVU1VIPU&v=20160406
latitude, longitue, clientID, clientSecret, Date



*/