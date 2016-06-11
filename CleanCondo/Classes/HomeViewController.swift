//
//  HomeViewController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 11/06/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var imgLogoConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var lblSloganConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnRegisterConstraint: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDesign()

    }
    
    
    func appDesign() {
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            if UIScreen.mainScreen().nativeBounds.height == 480 {
                print("iPhone Classic")
            }else if UIScreen.mainScreen().nativeBounds.height == 960 {
                
                imgLogoConstraint.constant = 45
                lblSloganConstraint.constant = 30
                btnRegisterConstraint.constant = -70
                print("iPhone 4 or 4S")
            }else if UIScreen.mainScreen().nativeBounds.height == 1136 {
                
                print("iPhone 5 or 5S or 5C")
            }else if UIScreen.mainScreen().nativeBounds.height == 1334 {
                
                lblSloganConstraint.constant = 101
                
                print("iPhone 6")
            }else if UIScreen.mainScreen().nativeBounds.height >= 1900 {

                lblSloganConstraint.constant = 121
                print("iPhone 6+")
            }else {
                print(UIScreen.mainScreen().nativeBounds.height)
            }
            
        }
        
    }


}
