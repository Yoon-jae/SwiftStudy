//
//  ViewController.swift
//  WeatherTable
//
//  Created by yoonjae Cho on 31/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, XMLParserDelegate {
    
    var datalist = [[String: String]] ()
    var detaildata:[String: String] = [:]
    var elementTemp:String = ""
    var blank:Bool = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        /* 하드코딩 방식, 셀이 없으니까 만들어줘야지.
         화면에 보이는 만큼만 Cell을 만들고, Scroll을 내리면 queue에 하나를 빼고, 하나를 넣는다. 이 때에도 이 함수가 호출 됨.
         if cell == nil {
         cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
         }
         */
        
        // print("indexPath row : \(indexPath.row)")
        
        var currentDic = datalist[indexPath.row]
        
        cell.countryLabel.text = currentDic["country"]
        cell.weatherLabel.text = currentDic["weather"]
        cell.temperatrueLabel.text = currentDic["temperature"]
        
        switch currentDic["weather"]! {
        case "맑음":
            cell.imgView.image = UIImage(named: "sunny.png")
        case "비":
            cell.imgView.image = UIImage(named: "rainy.png")
        case "흐림":
            cell.imgView.image = UIImage(named: "cloudy.png")
        case "눈":
            cell.imgView.image = UIImage(named: "snow.png")
        case "우박":
            cell.imgView.image = UIImage(named: "blizzard.png")
            
        default:
            cell.imgView.image = UIImage(named: "sunny.png")
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let baseURL = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"
        let parser = XMLParser(contentsOf: URL(string: baseURL)!)
        
        parser!.delegate = self
        parser!.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        elementTemp = elementName
        
        blank = true
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if blank && elementTemp != "local" && elementTemp != "weatherinfo" {
            detaildata[elementTemp] = string
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "local" {
            datalist += [detaildata]
//            print(detaildata)
        }
        blank = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

