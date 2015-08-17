//
//  MenuCell.swift
//  SampleProject
//
//  Created by Bala Murugan on 16/08/15.
//  Copyright (c) 2015 YellowGreen. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var lblSubMenu: UILabel!
    @IBOutlet weak var lblTitleMenu: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setMenuCell( menuName: String, subMenuName: String){
        
        self.lblTitleMenu.text=menuName
        self.lblSubMenu.text=subMenuName
    }}
