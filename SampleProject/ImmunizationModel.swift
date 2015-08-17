//
//  ImmunizationModel.swift
//  PatientPortal
//
//  Created by bms0013 on 14/08/15.
//  Copyright (c) 2015 bms0013. All rights reserved.
//

import UIKit
class Immunization{
    var VaccinationName:String
    var Description:String
    var ProductNameStatus:String
    var ImmunizedAge:String
    var Dose:String
    var LotNumber:String
    var InjectedOn:String
    var InjectedBy:String
    var DoseUnits:String
    var Abbriviation:String
    var Route:String
    var BodyDescription:String
    
    init(vaccinationName: String, description: String, productNameStatus: String,immunizedAge: String, dose: String, lotNumber:String,injectedOn:String,injectedBy:String,doseUnits: String, abbriviation:String,route:String,bodyDescription:String){
        
        
        
        self.VaccinationName = vaccinationName
        self.Description = description
        self.ProductNameStatus=productNameStatus
        self.ImmunizedAge=immunizedAge
        self.Dose = dose
        self.LotNumber = lotNumber
        self.InjectedOn=injectedOn
        self.InjectedBy=injectedBy
        self.DoseUnits = doseUnits
        self.Abbriviation = abbriviation
        self.Route=route
        self.BodyDescription=bodyDescription
    }
    
}
