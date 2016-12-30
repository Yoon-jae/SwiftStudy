//
//  SecondViewController.swift
//  TabbarEx
//
//  Created by yoonjae Cho on 30/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func buttonAction(_ sender: Any) {
        resultLabel.text = "2번 눌림"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        resultLabel.text = ""
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
