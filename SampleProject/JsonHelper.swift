//
//  JsonHelper.swift
//  eBluCarePatient
//
//  Created by BMS0015 on 10/08/15.
//  Copyright (c) 2015 BMS0015. All rights reserved.
//

import Foundation

class JsonHelper{
    
    //let serviceURL: String = "http://10.50.51.151/BMSEHRMobileService/PatientMobileService.svc/"
    let serviceURL: String = "http://icoolapps.com/"
    var methodName: String
    var params: AnyObject?
    
    init(method_name: String){
        self.methodName = method_name
        params = nil
    }
    
    init(method_name: String, params: AnyObject){
        self.methodName = method_name
        self.params = params
    }
    
    
    func AsyncGet(completionHandler: (resultMessage: String, resultObject: NSDictionary) -> ()){
        
        let urlPath = self.serviceURL+self.methodName
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        var resultModel: NSDictionary!
        var message: String!
        var err: NSError?
        
        let task = session.dataTaskWithURL(url!) {data, response, error in
            var jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
            
            if jsonResult != nil {
                message = jsonResult!.objectForKey("Message") as! String
                completionHandler(resultMessage: message!, resultObject: jsonResult!)
            }
            else{
                message = "ERROR"
            }
        }
        task.resume()
    }
    
    func AsyncGetList(completionHandler: (resultMessage: String, resultObject: NSArray) -> ()){
        
        let urlPath = self.serviceURL+self.methodName
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        var resultArray: NSArray!
        var resultModel: NSDictionary!
        var message: String!
        var err: NSError?
        
        let task = session.dataTaskWithURL(url!) {data, response, error in
            var jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
            
            if jsonResult != nil {
                message = jsonResult!.objectForKey("Message") as! String
                completionHandler(resultMessage: message!, resultObject: jsonResult!.objectForKey("ReturnModel") as! NSArray)
            }
            else{
                message = "ERROR"
            }
        }
        task.resume()
    }
    
    func AsyncPost(completionHandler: (resultMessage: String) -> ()){
               
        let urlPath = self.serviceURL+self.methodName
        let url = NSURL(string: urlPath)
        var request = NSMutableURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        var tenantID:String = "Tenant2"
        var resultMessage: String!
        var err: NSError?
        
        request.HTTPMethod = "POST"
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(self.params!, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTaskWithRequest(request) {data, response, error in
            
            var strData: String = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
            println("Data: \(strData)")
            if strData == "\"OK\"" {
                completionHandler(resultMessage: "OK")
            }
            else{
                completionHandler(resultMessage: "Unable to register. Please try after sometime.")
            }
        }
        task.resume()
    }
}