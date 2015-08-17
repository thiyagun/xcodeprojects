//
//  InsuranceTableViewController.swift
//  SampleProject
//
//  Created by Bala Murugan on 16/08/15.
//  Copyright (c) 2015 YellowGreen. All rights reserved.
//

import UIKit

class InsuranceTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var insuranceList = [Insurance]()
    var resultMessage: String = ""
    var resultObject: NSArray = NSArray()
    
    @IBOutlet weak var tblInsurance: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.sharedHUD.showInView(self.view, withHeader: "Loading", andFooter: "Please wait", progressBar: true)
        
        var functionName: String = "patientinsurance/"
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
            
            var insuranceArray: NSArray! = resultObject
            
            
            
            for (var i=0;i<insuranceArray.count;i++) {
                
                var objInsurance=Insurance(patientID: insuranceArray[i].objectForKey("PatientID")as! Int, insurerName: insuranceArray[i].objectForKey("InsurerName")as! String, relationDescription: insuranceArray[i].objectForKey("RelationDescription")as! String, patientInsuredID: insuranceArray[i].objectForKey("PatientInsuredID")as! String, groupName: insuranceArray[i].objectForKey("GroupName")as! String, eligPeriod: insuranceArray[i].objectForKey("EligPeriod")as! String, typeDescription: insuranceArray[i].objectForKey("TypeDescription")as! String, policyNumber: insuranceArray[i].objectForKey("PolicyNumber")as! String, organizationName: insuranceArray[i].objectForKey("OrganizationName")as! String, companyAddress: insuranceArray[i].objectForKey("CompanyAddress")as! String)
                
                
                
                
               
                insuranceList.append(objInsurance)
            }
            self.tblInsurance.reloadData()
        }
        else{
            
        }
    }
    
    @IBAction func btnBack(sender: AnyObject) {
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return insuranceList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let insuranceCell:InsuranceTableCell = tableView.dequeueReusableCellWithIdentifier("insCell") as! InsuranceTableCell
        
        insuranceCell.setIsuranceCell(insuranceList[indexPath.row].InsurerName, groupName: insuranceList[indexPath.row].GroupName, validPeriod: insuranceList[indexPath.row].EligPeriod, companyName:insuranceList[indexPath.row].OrganizationName, policyNo: insuranceList[indexPath.row].PolicyNumber)
        return insuranceCell
    }
    
}
