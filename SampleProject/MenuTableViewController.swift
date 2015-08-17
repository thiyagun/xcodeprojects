//
//  MenuTableViewController.swift
//  SampleProject
//
//  Created by Bala Murugan on 15/08/15.
//  Copyright (c) 2015 YellowGreen. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
var menus: [String] = ["Doctors","Our Hospitals","Insurance","Personal Health Record","Immunization", "Messages", "Patient Chat", "Check Updates"]
    
var subMenus: [String] = ["select a doctors to book an appointment","view the hospitals diffrant location","insurance details registered with this hosptal","view personal health record and update them","view latest immunization detail", "view the messages and notification ", "intract with admin deck", "updating data with facility"]
    
    @IBOutlet weak var viewOuter: UIView!
    
    @IBOutlet weak var tblViewMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewOuter.layer.cornerRadius=4.0
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

      
        
        let menuCell:MenuCell=tblViewMenu.dequeueReusableCellWithIdentifier("menuCell")as! MenuCell
        menuCell.layer.borderColor=UIColor.blueColor().CGColor
        menuCell.layer.borderWidth=1.0
        
        menuCell.setMenuCell(menus[indexPath.row], subMenuName: subMenus[indexPath.row])
        return menuCell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var menu_name: String! = menus[indexPath.row]
        let storyBoardID: UIStoryboard!
        let viewController: UIViewController!
        
        switch menu_name{
        case "Doctors":
            storyBoardID = UIStoryboard(name: "MessageStoryBoard", bundle: nil)
            viewController = storyBoardID.instantiateViewControllerWithIdentifier("MessageList") as! UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
        case "Our Hospitals":
            storyBoardID = UIStoryboard(name: "MessageStoryBoard", bundle: nil)
            viewController = storyBoardID.instantiateViewControllerWithIdentifier("MessageList") as! UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
        case "Insurance":
            storyBoardID = UIStoryboard(name: "Insurance", bundle: nil)
            viewController = storyBoardID.instantiateViewControllerWithIdentifier("Insurance") as! UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
        case "Personal Health Record":
            storyBoardID = UIStoryboard(name: "MessageStoryBoard", bundle: nil)
            viewController = storyBoardID.instantiateViewControllerWithIdentifier("MessageList") as! UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
        case "Immunization":
            storyBoardID = UIStoryboard(name: "Immunization", bundle: nil)
            viewController = storyBoardID.instantiateViewControllerWithIdentifier("Immunization") as! UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
        case "Messages":
            storyBoardID = UIStoryboard(name: "MessageStoryBoard", bundle: nil)
            viewController = storyBoardID.instantiateViewControllerWithIdentifier("MessageList") as! UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
        case "Patient Chat":
            storyBoardID = UIStoryboard(name: "MessageStoryBoard", bundle: nil)
            viewController = storyBoardID.instantiateViewControllerWithIdentifier("MessageList") as! UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
        case "Check Updates":
            storyBoardID = UIStoryboard(name: "MessageStoryBoard", bundle: nil)
            viewController = storyBoardID.instantiateViewControllerWithIdentifier("MessageList") as! UIViewController
            self.presentViewController(viewController, animated: true, completion: nil)
            
            
        default:
            println("\(menu_name) - clicked")
        }
    }
    
}
