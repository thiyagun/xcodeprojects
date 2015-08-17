//
//  VitalSignModel.swift
//  PatientPortal
//
//  Created by bms0013 on 14/08/15.
//  Copyright (c) 2015 bms0013. All rights reserved.
//

import UIKit
class VitalSign{
    
    var Height:String
    var PatientID:String
    var RecordedDate:String
    var Weight:String
    var Temperature:String
    var SmokingCategoryName:String
    var TemperatureLocationName:String
    var OxygenSaturation:String
    var BloodPressureSystolic:String
    var BloodPressureDiastolic:String
    var HeartRate:String
    var RespiratoryRate:String
    var HeadCircumference:String
    var WaistCircumference:String
    var Notes:String

    init(height:String,patientID:String,recordedDate:String,weight:String,temperature:String,smokingCategoryName:String,temperatureLocationName:String,oxygenSaturation:String,bloodPressureSystolic:String,bloodPressureDiastolic:String,heartRate:String,respiratoryRate:String,headCircumference:String,waistCircumference:String,notes:String){
        self.Height=height
        self.PatientID=patientID
        self.RecordedDate=recordedDate
        self.Weight=weight
        self.Temperature=temperature
        self.SmokingCategoryName=smokingCategoryName
        self.TemperatureLocationName=temperatureLocationName
        self.OxygenSaturation=oxygenSaturation
        self.BloodPressureSystolic=bloodPressureSystolic
        self.BloodPressureDiastolic=bloodPressureDiastolic
        self.HeartRate=heartRate
        self.RespiratoryRate=respiratoryRate
        self.HeadCircumference=headCircumference
        self.WaistCircumference=waistCircumference
        self.Notes=notes
        
    }

}
