//
//  ViewController.swift
//  MiniBrowser
//
//  Created by yoonjae Cho on 27/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet weak var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var mainWebView: UIWebView!
    @IBOutlet weak var spinnerActivityIndicatorView: UIActivityIndicatorView!
    
    @IBAction func bookMarkAction(_ sender: Any) {
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        let urlString = "https://www.\(bookMarkUrl!).com"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        if !urlString.hasPrefix("https://") {
            urlString = "https://\(urlTextField.text!)"
        }
        urlTextField.text = urlString
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://www.facebook.com"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        spinnerActivityIndicatorView.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinnerActivityIndicatorView.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

