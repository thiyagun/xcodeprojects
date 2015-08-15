//
//  SignUpViewController.swift
//  SampleProject
//
//  Created by Bala Murugan on 15/08/15.
//  Copyright (c) 2015 YellowGreen. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var txtRepeatPassword: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSignUp.layer.cornerRadius=5.0
        btnSignUp.layer.borderWidth=1.0
        btnSignUp.layer.borderColor=UIColor.blueColor().CGColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnSignUp(sender: AnyObject) {
        let UserName=txtUserName.text
        let Password=txtUserPassword.text
        let RepeatPassword=txtRepeatPassword.text
        if(UserName.isEmpty || Password.isEmpty || RepeatPassword.isEmpty){
            RegisterValidationMessage("All fields are required")
            return
        }
        if(Password != RepeatPassword){
            RegisterValidationMessage("Password must be same")
            return
        }
        
        //Store Data
        NSUserDefaults.standardUserDefaults().setObject(UserName, forKey: "UserName")
        NSUserDefaults.standardUserDefaults().setObject(Password, forKey: "Password")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        var registerAlert=UIAlertController(title: "Alert", message: "Registration is successful thankyou!",preferredStyle:UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default)
            {action in
//                self.dismissViewControllerAnimated(true, completion: nil)
                self.performSegueWithIdentifier("login_segue", sender: self)
                
                
        }
        registerAlert.addAction(okAction)
        self.presentViewController(registerAlert,animated:true,completion:nil)
          }
    
    func RegisterValidationMessage(userMessage:String){
        var registerAlert=UIAlertController(title: "Alert", message: userMessage,preferredStyle:UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler:nil)
        
        registerAlert.addAction(okAction)
        self.presentViewController(registerAlert,animated:true,completion:nil)
        
        
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
