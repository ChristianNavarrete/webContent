//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by HoodsDream on 3/11/15.
//  Copyright (c) 2015 HoodsDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.stackoverflow.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            
            (data, response, error) in
            
                if error == nil {
                    
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                    
                    //makes sure that its executed on the same queue(same time basically)
                    dispatch_async(dispatch_get_main_queue()) {
                    
                    self.webView.loadHTMLString(urlContent!, baseURL: nil)
                        
                    }
                    
                    println(urlContent)
                }
            
            }
            
            task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

