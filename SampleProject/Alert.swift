//
//  Alert.swift
//  eBluCarePatient
//
//  Created by BMS0015 on 10/08/15.
//  Copyright (c) 2015 BMS0015. All rights reserved.
//

import UIKit

class Alert {
    var alertTitle: String?
    var alertMessage: String! = "Retry?"
    var okTitle: String! = "Ok"
    var cancelTitle: String?
    var alert: UIAlertController!
    
    init(AlertTitle: String?, AlertMessage: String!, OkTitle: String!, CancelTitle: String?){
        self.alertTitle = AlertTitle
        self.alertMessage = AlertMessage
        self.okTitle = OkTitle
        self.cancelTitle = CancelTitle
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayAlert() -> UIAlertController {
        if self.alertTitle == nil {
            self.alertTitle = ""
        }
        self.alert = UIAlertController(title: self.alertTitle!, message: self.alertMessage!, preferredStyle: UIAlertControllerStyle.Alert)
        self.alert.addAction(UIAlertAction(title: self.okTitle!, style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction!) in self.fnprintOK(self.alertTitle!)}))
        if self.cancelTitle != nil {
            self.alert.addAction(UIAlertAction(title: self.cancelTitle!, style: UIAlertActionStyle.Cancel, handler: {(action: UIAlertAction!) in self.fnprintcancel(self.cancelTitle!)}))
        }
        
        return self.alert
    }
    
    func showAlert(view: UIView){
        self.displayAlert()
    }
    
    func fnprintOK(title: String){
        println("\(title) Clicked")
        //Perform OK actions here
    }
    
    func fnprintcancel(title: String){
        println("\(title) Clicked")
        //Perform Cancel actions here
    }
}

