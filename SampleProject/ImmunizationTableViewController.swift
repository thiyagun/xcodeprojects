//
//  ImmunizationTableViewController.swift
//  SampleProject
//
//  Created by Bala Murugan on 16/08/15.
//  Copyright (c) 2015 YellowGreen. All rights reserved.
//

import UIKit

class ImmunizationTableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var immunizationList = [Immunization]()
    var resultMessage: String = ""
    var resultObject: NSArray = NSArray()
    
    
    @IBOutlet weak var navTitleBar: UINavigationItem!
    @IBOutlet weak var tblImmunization: UITableView!
    @IBOutlet weak var innerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navTitleBar.title = "Menu"
        tblImmunization.layer.cornerRadius=4.0
        tblImmunization.tableFooterView = UIView(frame: CGRect.zeroRect)
        tblImmunization.layer.backgroundColor=UIColor.greenColor().CGColor
        ProgressHUD.sharedHUD.showInView(self.view, withHeader: "Loading", andFooter: "Please wait", progressBar: true)
        
        var functionName: String = "immunization/"
        var jsonHelper: JsonHelper = JsonHelper(method_name: functionName)
        
        dispatch_async(dispatch_get_main_queue(), {
            jsonHelper.AsyncGetList{
                resultMessage, resultObject in
                self.resultMessage = resultMessage
                self.resultObject = resultObject
                self.manipulateAsyncResult(self.resultMessage, resultObject: self.resultObject)
            }
        })
        
    }
    func manipulateAsyncResult(resultMessage: String, resultObject: NSArray){
        if resultMessage == "OK"{
            ProgressHUD.sharedHUD.hide()
            
            var immunizationArray: NSArray! = resultObject
            
            
            
            for (var i=0;i<immunizationArray.count;i++) {
                
                var objImmunization=Immunization(vaccinationName: immunizationArray[i].objectForKey("VaccinationName")as! String, description: immunizationArray[i].objectForKey("Description")as! String, productNameStatus: immunizationArray[i].objectForKey("ProductNameStatus")as! String, immunizedAge: immunizationArray[i].objectForKey("ImmunizedAge")as! String, dose: immunizationArray[i].objectForKey("Dose")as! String, lotNumber: immunizationArray[i].objectForKey("LotNumber")as! String, injectedOn: immunizationArray[i].objectForKey("InjectedOn")as! String, injectedBy: immunizationArray[i].objectForKey("InjectedBy")as! String, doseUnits: immunizationArray[i].objectForKey("DoseUnits")as! String, abbriviation: immunizationArray[i].objectForKey("Abbriviation")as! String, route: immunizationArray[i].objectForKey("Route")as! String, bodyDescription: immunizationArray[i].objectForKey("BodyDescription")as! String)
                
                
                immunizationList.append(objImmunization)
            }
            self.tblImmunization.reloadData()
        }
        else{
            
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return immunizationList.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let immunizationCell:ImmunizationTableCell = tableView.dequeueReusableCellWithIdentifier("immunCell") as! ImmunizationTableCell
        immunizationCell.layer.borderWidth=1.0
        immunizationCell.layer.borderColor=UIColor.greenColor().CGColor
        immunizationCell.setImmunizationCell(immunizationList[indexPath.row].VaccinationName, injectedOn: immunizationList[indexPath.row].InjectedOn, injectedBy: immunizationList[indexPath.row].InjectedBy, bodyDescription: immunizationList[indexPath.row].BodyDescription)
        return immunizationCell
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
