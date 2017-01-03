//
//  ViewController.swift
//  ImageDownload
//
//  Created by yoonjae Cho on 03/01/2017.
//  Copyright © 2017 yoonjae Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {

    @IBOutlet var imgVIew: UIImageView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var progressView: UIProgressView!
    
    var downloadTask:URLSessionDownloadTask!
    
    @IBAction func downloadAction(_ sender: Any) {
        self.indicator.startAnimating()
        self.progressView.setProgress(0.0, animated: false)
        self.imgVIew.image = nil

        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
        downloadTask = session.downloadTask(with: URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!)
        downloadTask.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//        print("bytesWritten : \(bytesWritten)")
//        print("totalBytesWritten : \(totalBytesWritten)")
//        print("totalBytesExpectedToWrite : \(totalBytesExpectedToWrite)")
        let progressValue:Float = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        self.progressView.setProgress(progressValue, animated: true)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let tempData:Data = try! Data(contentsOf: location)
        self.imgVIew.image = UIImage(data: tempData)
        self.indicator.stopAnimating()
    }
    
    @IBAction func suspendAction(_ sender: Any) {
        self.downloadTask.suspend()
    }
    
    @IBAction func resumeAction(_ sender: Any) {
        self.downloadTask.resume()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.downloadTask.cancel()
        self.progressView.setProgress(0.0, animated: false)
        self.imgVIew.image = nil
        self.indicator.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

