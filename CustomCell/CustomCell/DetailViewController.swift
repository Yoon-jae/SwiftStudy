//
//  DetailViewController.swift
//  CustomCell
//
//  Created by yoonjae Cho on 31/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailDataDic = [String: String] ()
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var imgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = detailDataDic["name"]!
        amountLabel.text = detailDataDic["amount"]!
        valueLabel.text = detailDataDic["value"]!
        imgView.layer.cornerRadius = 50.0
        imgView.layer.masksToBounds = true
        imgView.image = UIImage(named: detailDataDic["image"]!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
