//
//  ViewController.swift
//  API2
//
//  Created by Barbara Ristau on 4/6/16.
//  Copyright © 2016 Barbara. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var items = [FourSquareModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFourSquareData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addFourSquareData() {
        
        
        FourSquareClient.sharedInstance.fetchNetworkData({ (json: JSON) in
            if let results = json["results"].array {
                for entry in results {
                    self.items.append(FourSquareModel(jsonData: entry["name"]))
                    print(self.items)
                }
                dispatch_async(dispatch_get_main_queue(),{
                    self.tableView.reloadData()
                })
            }
            })
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
        }
        let venue = self.items[indexPath.row]
        print(venue)
        
        cell!.textLabel?.text = venue.venueName
        return cell!
    }


}

