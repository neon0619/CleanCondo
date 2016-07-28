//
//  UnitViewController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 28/07/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class UnitViewController: UIViewController {
    
    
    @IBOutlet weak var nlcUnit: NSLayoutConstraint!
    @IBOutlet weak var nlcArea: NSLayoutConstraint!
    @IBOutlet weak var nlcButton: NSLayoutConstraint!

    @IBOutlet weak var txtArea: UITextField!
    @IBOutlet weak var txtBuilding: UITextField!
    @IBOutlet weak var txtUnit: UITextField!
    @IBOutlet weak var txtBedroom: UITextField!
    @IBOutlet weak var txtBathroom: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appDesign()
    }
    
    func appDesign() {
        
        padding(padding: 8, txtField: txtArea)
        padding(padding: 8, txtField: txtBuilding)
        padding(padding: 8, txtField: txtUnit)
        padding(padding: 33, txtField: txtBedroom)
        padding(padding: 33, txtField: txtBathroom)
        
        if UIDevice.current().userInterfaceIdiom == .phone {
            if UIScreen.main().nativeBounds.height == 480 {
                print("iPhone Classic")
            }else if UIScreen.main().nativeBounds.height == 960 {
                
                print("iPhone 4 or 4S")
            }else if UIScreen.main().nativeBounds.height == 1136 {
                
                print("iPhone 5 or 5S or 5C")
            }else if UIScreen.main().nativeBounds.height == 1334 {
                nlcUnit.constant = 70
                nlcArea.constant = 30 + 15
                nlcButton.constant = 52 + 15
                print("iPhone 6")
            }else if UIScreen.main().nativeBounds.height >= 1900 {
                nlcUnit.constant = 80
                nlcArea.constant = 30 + 20
                nlcButton.constant = 52 + 20
                print("iPhone 6+")
            }else {
                print(UIScreen.main().nativeBounds.height)
            }
            
        }
        
    }
    
    func padding(padding: Int, txtField: UITextField) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: Int(txtField.frame.height)))
        txtField.leftView = paddingView
        txtField.leftViewMode = UITextFieldViewMode.always
        
    }

}
