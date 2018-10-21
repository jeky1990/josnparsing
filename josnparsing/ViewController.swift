//
//  ViewController.swift
//  josnparsing
//
//  Created by mac on 26/09/18.
//  Copyright © 2018 jeky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var TrainArray : [Any] = []
    var DataDic : [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GetJsonData()
        
    }
    
    func GetJsonData()
    {
        print(DataDic)
        
        let url = URL(string: "https://api.railwayapi.com/v2/between/source/\(DataDic[0])/dest/\(DataDic[1])/date/\(DataDic[2])/apikey/d52ymb8phj/")
        
        print(url!)
        
        do{
            let data = try Data(contentsOf: url!)
            let jsondata = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            
            let trains = jsondata["trains"] as! [Any]
            TrainArray = trains
            
        }catch{}
    }
}

extension ViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TrainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:CELL = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CELL
        
        let dic = TrainArray[indexPath.row] as! [String:Any]
        
        cell.TrainName.text = dic["name"] as? String
        cell.TrainNumber.text = dic["number"] as? String
        cell.TravelTime.text = dic["travel_time"] as? String
        
        let FromStationDic = dic["from_station"] as! [String:Any]
        cell.SourceName.text = FromStationDic["name"] as? String
        cell.ArivalTime.text = dic["src_departure_time"] as? String
        
        let ToSatationDic = dic["to_station"] as! [String:Any]
        cell.DetName.text = ToSatationDic["name"] as? String
        cell.DestTime.text = dic["dest_arrival_time"] as? String
        
        return cell
    }
    
    
}
extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

