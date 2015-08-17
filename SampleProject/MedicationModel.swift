//
//  MedicationModel.swift
//  PatientPortal
//
//  Created by bms0013 on 14/08/15.
//  Copyright (c) 2015 bms0013. All rights reserved.
//

import UIKit
class Medication{
    
    var StartedDate:String
    var ExpiryDate:String
    var PrescribedDate:String
    var PatientInstructions:String
    var Prescriber:String
    var Refill:String
    var SubstitutionDrug:String
    var SideEffects:String
    var Quantity:String
    var NotesToPharmacist:String
    var PatientTransactionID:String
    var DosageForm:String
    var DrugName:String
    var DrugCode:String
    
    init(startedDate:String,expiryDate:String,prescribedDate:String,patientInstructions:String,prescriber:String,refill:String,substitutionDrug:String,sideEffects:String,quantity:String,notesToPharmacist:String,patientTransactionID:String,dosageForm:String,drugName:String,drugCode:String){
        self.StartedDate=startedDate
        self.ExpiryDate=expiryDate
        self.PrescribedDate=prescribedDate
        self.PatientInstructions=patientInstructions
        self.Prescriber=prescriber
        self.Refill=refill
        self.SubstitutionDrug=substitutionDrug
        self.SideEffects=sideEffects
        self.Quantity=quantity
        self.NotesToPharmacist=notesToPharmacist
        self.PatientTransactionID=patientTransactionID
        self.DosageForm=dosageForm
        self.DrugName=drugName
        self.DrugCode=drugCode
        
    }
}
