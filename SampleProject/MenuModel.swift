//
//  MenuModel.swift
//  SampleProject
//
//  Created by Bala Murugan on 16/08/15.
//  Copyright (c) 2015 YellowGreen. All rights reserved.
//

import Foundation

var MenuList: Menu = Menu()
var MenuSubList: SubMenu=SubMenu()

class Menu{
    var menus: [String] = ["Doctors","Our Hospitals","Insurance","Personal Health Record","Immunization", "Messages", "Patient Chat", "Check Updates"]
}
class SubMenu{
    var subMenus: [String] = ["select a doctors to book an appointment","view the hospitals diffrant location","insurance details registered with this hosptal","view personal health record and update them","view latest immunization detail", "view the messages and notification ", "intract with admin deck", "updating data with facility"]
}