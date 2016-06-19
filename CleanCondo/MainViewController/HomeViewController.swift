//
//  HomeViewController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 11/06/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var nlcLogo: NSLayoutConstraint!
    @IBOutlet weak var nlcSlogan: NSLayoutConstraint!
    @IBOutlet weak var nlcBtnLogin: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDesign()

    }
    
    
    func appDesign() {
        
        if UIDevice.current().userInterfaceIdiom == .phone {
            if UIScreen.main().nativeBounds.height == 480 {
                print("iPhone Classic")
            }else if UIScreen.main().nativeBounds.height == 960 {
                
                nlcLogo.constant = 50
                nlcSlogan.constant = 45
                nlcBtnLogin.constant = 145
                print("iPhone 4 or 4S")
            }else if UIScreen.main().nativeBounds.height == 1136 {
                
                print("iPhone 5 or 5S or 5C")
            }else if UIScreen.main().nativeBounds.height == 1334 {
                
                nlcLogo.constant = 95
                nlcSlogan.constant = 75
                nlcBtnLogin.constant = 220
                print("iPhone 6")
            }else if UIScreen.main().nativeBounds.height >= 1900 {

                nlcLogo.constant = 100
                nlcSlogan.constant = 90
                nlcBtnLogin.constant = 250
                print("iPhone 6+")
            }else {
                print(UIScreen.main().nativeBounds.height)
            }
            
        } else if UIDevice.current().userInterfaceIdiom == .pad {
            
            print("iPAd")
            
        }
        
    }


}
