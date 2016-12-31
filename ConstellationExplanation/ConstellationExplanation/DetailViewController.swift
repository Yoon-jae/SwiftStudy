//
//  DetailViewController.swift
//  ConstellationExplanation
//
//  Created by yoonjae Cho on 31/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBAction func backButtonAction(_ sender: Any) {
        let tempView = self.navigationController?.popViewController(animated: true)
        print(tempView!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
