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
    

    
    var venueName: String!
    
    required init(json: JSON) {
        venueName = json["name"].stringValue
    }
    
}
