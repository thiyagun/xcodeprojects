//
//  MedicalHistoryModel.swift
//  PatientPortal
//
//  Created by bms0013 on 14/08/15.
//  Copyright (c) 2015 bms0013. All rights reserved.
//

import UIKit
class MedicalHistory{
    var RecordedDate:String
    var ClinicalNotes:String
    var DiagnosedDate:String
    var PatientTransactionID:String
    init(recordedDate:String,clinicalNotes:String,diagnosedDate:String,patientTransactionID:String){
       self.RecordedDate=recordedDate
        self.ClinicalNotes=clinicalNotes
        self.DiagnosedDate=diagnosedDate
        self.PatientTransactionID=patientTransactionID
    }
}
