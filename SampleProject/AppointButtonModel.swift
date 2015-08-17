//
//  AppointButtonModel.swift
//  PatientPortal
//
//  Created by bms0013 on 12/08/15.
//  Copyright (c) 2015 bms0013. All rights reserved.
//

import UIKit
class AppointmentButton{
    var AppTime:String
    var AppStatus:String
    var TimeSlot:String
    init(appTime:String,appStatus:String,timeSlot:String){
        self.AppTime=appTime
        self.AppStatus=appStatus
        self.TimeSlot=timeSlot
    }
}
