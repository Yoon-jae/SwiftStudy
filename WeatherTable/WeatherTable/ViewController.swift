//
//  ViewController.swift
//  WeatherTable
//
//  Created by yoonjae Cho on 31/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var datalist:[[String: String]] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        /* 하드코딩 방식, 셀이 없으니까 만들어줘야지.
           화면에 보이는 만큼만 Cell을 만들고, Scroll을 내리면 queue에 하나를 빼고, 하나를 넣는다. 이 때에도 이 함수가 호출 됨.
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        }
        */
        
        // print("indexPath row : \(indexPath.row)")
        
        var currentDic = datalist[indexPath.row]
        cell.textLabel!.text = currentDic["지역"]
        cell.detailTextLabel!.text = currentDic["날씨"]
        
        switch currentDic["날씨"]! {
        case "맑음":
            cell.imageView!.image = UIImage(named: "sunny.png")
        case "비":
            cell.imageView!.image = UIImage(named: "rainy.png")
        case "흐림":
            cell.imageView!.image = UIImage(named: "cloudy.png")
        case "눈":
            cell.imageView!.image = UIImage(named: "snow.png")
        case "우박":
            cell.imageView!.image = UIImage(named: "blizzard.png")
            
        default:
            cell.imageView!.image = UIImage(named: "sunny.png")
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dict1 = ["지역":"한국","날씨":"비"]
        let dict2 = ["지역":"일본","날씨":"맑음"]
        let dict3 = ["지역":"중국","날씨":"눈"]
        let dict4 = ["지역":"스페인","날씨":"우박"]
        let dict5 = ["지역":"미국","날씨":"흐림"]
        let dict6 = ["지역":"영국","날씨":"비"]
        let dict7 = ["지역":"프랑스","날씨":"흐림"]
        let dict8 = ["지역":"브라질","날씨":"우박"]
        let dict9 = ["지역":"스위스","날씨":"맑음"]
        let dict10 = ["지역":"덴마크","날씨":"비"]
        let dict11 = ["지역":"스웨덴","날씨":"눈"]
        let dict12 = ["지역":"네덜란드","날씨":"비"]
        let dict13 = ["지역":"크로아티아","날씨":"맑음"]
        let dict14 = ["지역":"필리핀","날씨":"맑음"]
        let dict15 = ["지역":"독일","날씨":"눈"]
        let dict16 = ["지역":"헝가리","날씨":"비"]
        let dict17 = ["지역":"벨기에","날씨":"흐림"]
        let dict18 = ["지역":"핀란드","날씨":"우박"]
        let dict19 = ["지역":"이탈리아","날씨":"맑음"]
        
        datalist = [dict1,dict2,dict3,dict4,dict5,dict6,dict7,dict8,dict9,dict10,dict11,dict12,dict13,dict14,dict15,dict16,dict17,dict18,dict19]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

