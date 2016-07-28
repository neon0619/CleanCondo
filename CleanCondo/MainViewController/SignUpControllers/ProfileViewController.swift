//
//  ProfileViewController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 28/07/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nlcProfile: NSLayoutConstraint!
    @IBOutlet weak var nlcName: NSLayoutConstraint!
    @IBOutlet weak var nlcButton: NSLayoutConstraint!
    
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appDesign()
    }

    
    
    func appDesign() {
        
        padding(txtField: txtFirstName)
        padding(txtField: txtLastName)
        padding(txtField: txtEmail)
        padding(txtField: txtPassword)
        padding(txtField: txtMobile)
        
        if UIDevice.current().userInterfaceIdiom == .phone {
            if UIScreen.main().nativeBounds.height == 480 {
                print("iPhone Classic")
            }else if UIScreen.main().nativeBounds.height == 960 {
                
                print("iPhone 4 or 4S")
            }else if UIScreen.main().nativeBounds.height == 1136 {
                
                print("iPhone 5 or 5S or 5C")
            }else if UIScreen.main().nativeBounds.height == 1334 {
                nlcProfile.constant = 70
                nlcName.constant = 30 + 15
                nlcButton.constant = 30 + 15
                
                
                print("iPhone 6")
            }else if UIScreen.main().nativeBounds.height >= 1900 {
                nlcProfile.constant = 80
                nlcName.constant = 30 + 20
                nlcButton.constant = 30 + 20
                
                print("iPhone 6+")
            }else {
                print(UIScreen.main().nativeBounds.height)
            }
            
        }
        
    }
    
    
    func padding(txtField: UITextField) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: txtField.frame.height))
        txtField.leftView = paddingView
        txtField.leftViewMode = UITextFieldViewMode.always
        
    }
    

    
}
