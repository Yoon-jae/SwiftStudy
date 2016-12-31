//
//  ViewController.swift
//  WeatherTableUsingJSONParser
//
//  Created by yoonjae Cho on 31/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var datalist = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.json")
        
        do {
            self.datalist =  try JSONSerialization.jsonObject(with: Data(contentsOf: baseURL!), options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        } catch {
            print("Error loading data")
        }
        
        print(self.datalist)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((datalist["weatherinfo"] as! NSDictionary)["local"] as! NSArray).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        let currentDic = ((datalist["weatherinfo"] as! NSDictionary)["local"] as! NSArray)[indexPath.row] as! NSDictionary
        
        cell.countryLabel.text = currentDic["country"] as? String
        
        let weatherStr = currentDic["weather"] as? String
        cell.weatherLabel.text = weatherStr
        
        cell.temperatureLabel.text = currentDic["temperature"] as? String
        
        if weatherStr == "맑음" {
            cell.imgView.image = UIImage(named: "sunny.png")
        } else if weatherStr == "비" {
            cell.imgView.image = UIImage(named: "rainy.png")
        } else if weatherStr == "흐림" {
            cell.imgView.image = UIImage(named: "cloudy.png")
        } else if weatherStr == "눈" {
            cell.imgView.image = UIImage(named: "snow.png")
        } else if weatherStr == "우박" {
            cell.imgView.image = UIImage(named: "blizzard.png")
        }
        return cell
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

