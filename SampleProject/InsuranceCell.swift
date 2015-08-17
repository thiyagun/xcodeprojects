//
//  InsuranceCell.swift
//  SampleProject
//
//  Created by Bala Murugan on 16/08/15.
//  Copyright (c) 2015 YellowGreen. All rights reserved.
//

import UIKit

class InsuranceTableCell: UITableViewCell {
    
   
    @IBOutlet weak var lblInsurarName: UILabel!
    
    @IBOutlet weak var lblGroupName: UILabel!
    @IBOutlet weak var lblValidPeriod: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblPolicyNo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setIsuranceCell( insurarName: String, groupName: String, validPeriod: String, companyName: String, policyNo: String){
        
        self.lblInsurarName.text=insurarName
        self.lblPolicyNo.text=policyNo
        self.lblCompanyName.text=companyName
        self.lblValidPeriod.text=validPeriod
        self.lblGroupName.text=groupName
    }}