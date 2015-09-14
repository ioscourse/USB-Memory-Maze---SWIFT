//
//  MyRVCViewController.swift
//  CISDIVAPP
//
//  Created by Charles Konkol on 3/24/15.
//  Copyright (c) 2015 Rock Valley College. All rights reserved.
//

import UIKit

class MyRVCViewController: UIViewController {

    @IBOutlet weak var navbar: UINavigationItem!
   

    
    @IBAction func btnBackUp(sender: UIBarButtonItem) {
        webview.goBack()
    }
    
    @IBAction func btnForwardUp(sender: UIBarButtonItem) {
         webview.goForward()
    }
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if BoolAdmin==false
        {
            let url = NSURL(string: "http://ckonkol.com/cis/")
            let request = NSURLRequest(URL: url!)
            webview.scalesPageToFit = true
            webview.loadRequest(request)
        }
        else
        {
          navbar.title = "Admin Database"
            BoolAdmin=false
            let url = NSURL(string: "http://ckonkol.com/cis/report.php")
            let request = NSURLRequest(URL: url!)
            webview.scalesPageToFit = true
            webview.loadRequest(request)
        }
       
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
