//
//  MainViewController.swift
//  testgame
//
//  Created by Charles Konkol on 3/24/15.
//  Copyright (c) 2015 Rock Valley College. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    var newWordField: UITextField!
    var strNewWord:String!
    var count:Int=0
    
    
    func wordEntered(alert: UIAlertAction!){
        // store the new word
        strNewWord = self.newWordField.text
        if  strNewWord == "rvc@dmin77"
        {
            var vc = self.storyboard?.instantiateViewControllerWithIdentifier("myrvc") as! MyRVCViewController
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else
        {
            count += 1
            if count > 2
            {
                var alert = UIAlertController(title: "Access Denied", message: "To many attempts. Please contact c.konkol@rockvalleycollege.edu", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            
            
        }
    }
    func addTextField(textField: UITextField!){
        // add the text field and make the result global
        textField.placeholder = "Enter Admin Password"
        textField.secureTextEntry = true
        self.newWordField = textField
        print("asdasdsad" + self.newWordField.text)
    }

   
    @IBAction func btnAdmin(sender: AnyObject) {
        BoolAdmin=true
        GotoWeb()
    }
    
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
        var filePath = NSBundle.mainBundle().pathForResource("mygames", ofType: "gif")
        
        var gif = NSData(contentsOfFile: filePath!)
        
     
//       var webViewBG = UIWebView(frame: self.view.frame)
//        webViewBG.loadData(gif, MIMEType: "image/gif", textEncodingName: nil, baseURL: nil)
//        
//        webViewBG.userInteractionEnabled = false;
//        
//        self.view.addSubview(webViewBG)
        
       webview.loadData(gif, MIMEType: "image/gif", textEncodingName: nil, baseURL: nil)
        
        webview.userInteractionEnabled = false;
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func msgbox()
    {
        if count > 2
        {
            var alert = UIAlertController(title: "Access Denied", message: "To many attempts. Please contact c.konkol@rockvalleycollege.edu", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        else
        {
            // display an alert
            let newWordPrompt = UIAlertController(title: "Enter Admin Password", message: "Rock Valley College Faculty Only", preferredStyle: UIAlertControllerStyle.Alert)
            newWordPrompt.addTextFieldWithConfigurationHandler(addTextField)
            newWordPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
            newWordPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: wordEntered))
            presentViewController(newWordPrompt, animated: true, completion: nil)
        }

      
      
    }
    
    func GotoWeb()
    {
        if BoolAdmin==false
        {
            var vc = self.storyboard?.instantiateViewControllerWithIdentifier("maingame") as! GameViewController
        self.presentViewController(vc, animated: true, completion: nil)
        }
        else
        {
            msgbox()
        
            
           
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
