//
//  ViewController.swift
//  SelectCar
//
//  Created by yoonjae Cho on 29/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var imgView: UIImageView!
    
    // Component 0
    let carCompanyName = ["Tesla", "Lamborghini", "Porsche"]
    
    var carModel:[String] = []
    var carModelImage:[String] = []
    
    // Componenet 1
    let tesla = ["Model S", "Model X"]
    let lamborghini = ["Aventador", "Huracan", "Veneno"]
    let porsche = ["911", "Boxter"]
    
    // Image array
    let teslaImages = ["tesla-model-s.jpg", "tesla-model-x.jpg"]
    let lamborghiniImages = ["lamborghini-aventador.jpg", "lamborghini-huracan.jpg", "lamborghini-veneno.jpg"]
    let porscheImages = ["porsche-911.jpg", "porsche-boxter.jpg"]
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 { // numberOfRowsInComponent 즉 Column의 number
            return carCompanyName.count
        } else {
            return carModel.count
        }
    }
    
    // UIPickerView Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return carCompanyName[row]
        } else {
            return carModel[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            if row == 0 {
                carModel = tesla
                carModelImage = teslaImages
            } else if row == 1 {
                carModel = lamborghini
                carModelImage = lamborghiniImages
            } else {
                carModel = porsche
                carModelImage = porscheImages
            }
        }
        
        // 값은 바뀌었으나, 다시 Refresh를 해줘야 한다.
        pickerView.reloadAllComponents()
        imgView.image = UIImage(named: carModelImage[pickerView.selectedRow(inComponent: 1)])
    }
    
    // UIPickerView DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carModel = tesla
        carModelImage = teslaImages
        
        imgView.layer.cornerRadius = 50.0
        imgView.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

