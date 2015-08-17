//
//  ImmunizationCell.swift
//  SampleProject
//
//  Created by Bala Murugan on 16/08/15.
//  Copyright (c) 2015 YellowGreen. All rights reserved.
//

import UIKit

class ImmunizationTableCell: UITableViewCell {
    
    
    @IBOutlet weak var lblBodyDescription: UILabel!
    @IBOutlet weak var lblInjectedBy: UILabel!
    @IBOutlet weak var lblInjectedOn: UILabel!
    @IBOutlet weak var lblVacinationName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setImmunizationCell( vacinationName: String, injectedOn: String, injectedBy: String, bodyDescription: String){
        
        self.lblVacinationName.text=vacinationName
        self.lblInjectedOn.text=injectedOn
        self.lblInjectedBy.text=injectedBy
        self.lblBodyDescription.text=bodyDescription
        

    }
    
}
