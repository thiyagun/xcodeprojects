//
//  AllergyModel.swift
//  PatientPortal
//
//  Created by bms0013 on 14/08/15.
//  Copyright (c) 2015 bms0013. All rights reserved.
//

import UIKit
class Allergy{
    var RecordedDate:String
    var Reaction:String
    var AllergyName:String
    var Notes:String
    var AllergyDescription:String
    var AllergyType:String
    var AllergySeverity:String
    
    init(recordedDate:String,reaction:String,allergyName:String,notes:String,allergyDescription:String,allergyType:String,allergySeverity:String){
        self.RecordedDate=recordedDate
        self.Reaction=reaction
        self.AllergyName=allergyName
        self.Notes=notes
        self.AllergyDescription=allergyDescription
        self.AllergyType=allergyType
        self.AllergySeverity=allergySeverity
    }

}
