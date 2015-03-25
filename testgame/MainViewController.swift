//
//  MainViewController.swift
//  testgame
//
//  Created by Charles Konkol on 3/24/15.
//  Copyright (c) 2015 Rock Valley College. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBAction func btneasy(sender: UIButton) {
        levels = "2"
        GotoWeb()
    }
    
  
    
    @IBOutlet weak var webview: UIWebView!
    @IBAction func btnMed(sender: AnyObject) {
        levels = "4"
        GotoWeb()
    }
    
    @IBAction func btnHard(sender: AnyObject) {
        levels = "6"
        GotoWeb()
    }
    
    @IBOutlet weak var names: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
     //  names.text = "hello"
        levels = "2"
        var filePath = NSBundle.mainBundle().pathForResource("mygame", ofType: "gif")
        
        var gif = NSData(contentsOfFile: filePath!)
        
       // webview = UIWebView(frame:  vc.view.frame)
       
        
        webview.loadData(gif, MIMEType: "image/gif", textEncodingName: nil, baseURL: nil)
        
        webview.userInteractionEnabled = false;
        
      //  self.view.addSubview(webview)
        
       
        

               // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func GotoWeb()
    {
        var vc = self.storyboard?.instantiateViewControllerWithIdentifier("maingame") as GameViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
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
