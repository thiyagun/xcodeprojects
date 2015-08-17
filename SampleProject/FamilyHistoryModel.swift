//
//  FamilyHistoryModel.swift
//  PatientPortal
//
//  Created by bms0013 on 14/08/15.
//  Copyright (c) 2015 bms0013. All rights reserved.
//

import UIKit
class FamilyHistory{
    var RecordedDate:String
    var PersonName:String
    var PatientRelationShipDescription:String
    var ClinicalNotes:String
    init(recordedDate:String,personName:String,patientRelationShipDescription:String,clinicalNotes:String){
      self.RecordedDate=recordedDate
        self.PersonName=personName
        self.PatientRelationShipDescription=patientRelationShipDescription
        self.ClinicalNotes=clinicalNotes
    }
}
