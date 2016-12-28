//
//  ViewController.swift
//  FlightBooking
//
//  Created by yoonjae Cho on 28/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var selectDatePicker: UIDatePicker!
    
    @IBOutlet var departureDateButton: UIButton!
    @IBOutlet var returnDateButton: UIButton!
    @IBOutlet var returnDateLabel: UILabel!
    
    var buttonTag:Int = 1
    
    @IBAction func showReturnDateAction(_ sender: Any) {
//        print(sender.description!)
        returnDateLabel.isHidden = !(sender as! UISwitch).isOn
        returnDateButton.isHidden = !(sender as! UISwitch).isOn
    }
    
    @IBAction func showDatePickerAction(_ sender: Any) {
        if selectDatePicker.isHidden {
            selectDatePicker.isHidden = false
        }
        buttonTag = (sender as! UIButton).tag
    }
    
    @IBAction func selectedDateAction(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-d hh:mma"
        let dateString = formatter.string(from: (sender as! UIDatePicker).date)
        if(buttonTag == 1) {
            departureDateButton.setTitle(dateString, for: UIControlState())
        } else {
            returnDateButton.setTitle(dateString, for: UIControlState())
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.resignFirstResponder()
        selectDatePicker.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnDateLabel.isHidden = true
        returnDateButton.isHidden = true
        selectDatePicker.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

