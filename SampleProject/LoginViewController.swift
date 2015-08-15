//
//  LoginViewController.swift
//  SampleProject
//
//  Created by Bala Murugan on 15/08/15.
//  Copyright (c) 2015 YellowGreen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var innerViewRectangle: UIView!
    @IBOutlet weak var viewRectangle: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewRectangle.layer.cornerRadius=8.0
        innerViewRectangle.layer.cornerRadius=4.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnLogin(sender: AnyObject) {
        let userID=txtUserName.text
        let password=txtPassword.text
        
        let userNameStored=NSUserDefaults.standardUserDefaults().stringForKey("UserName")
        
        let userPasswordStored=NSUserDefaults.standardUserDefaults().stringForKey("Password")
        
        if(userNameStored == userID ){
            if(userPasswordStored == password){
                //Login Successfull
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedin")
//                NSUserDefaults.standardUserDefaults().synchronize()
//                self.dismissViewControllerAnimated(true, completion: nil)
                
                self.performSegueWithIdentifier("menu_segue", sender: self)
            }
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
