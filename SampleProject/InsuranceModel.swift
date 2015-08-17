//
//  InsuranceModel.swift
//  PatientPortal
//
//  Created by bms0013 on 14/08/15.
//  Copyright (c) 2015 bms0013. All rights reserved.
//

import UIKit
class Insurance{
    var PatientID:Int
    var InsurerName:String
    var RelationDescription:String
    var PatientInsuredID:String
    var GroupName:String
    var EligPeriod:String
    var TypeDescription:String
    var PolicyNumber:String
    var OrganizationName:String
    var CompanyAddress:String
    
    init(patientID:Int,insurerName:String,relationDescription:String,patientInsuredID:String,groupName:String,eligPeriod:String,typeDescription:String,policyNumber:String,organizationName:String,companyAddress:String){
        self.PatientID=patientID
        self.InsurerName=insurerName
        self.RelationDescription=relationDescription
        self.PatientInsuredID=patientInsuredID
        self.GroupName=groupName
        self.EligPeriod=eligPeriod
        self.TypeDescription=typeDescription
        self.PolicyNumber=policyNumber
        self.OrganizationName=organizationName
        self.CompanyAddress=companyAddress
    }
}
