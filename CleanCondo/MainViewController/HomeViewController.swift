//
//  HomeViewController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 11/06/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    

    @IBOutlet weak var nlcLogo: NSLayoutConstraint!
    @IBOutlet weak var nlcSlogan: NSLayoutConstraint!
    @IBOutlet weak var nlcBtnLogin: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared().statusBarStyle = .lightContent
        
        appDesign()

    }
    
    
    func appDesign() {
        
        if UIDevice.current().userInterfaceIdiom == .phone {
            if UIScreen.main().nativeBounds.height == 480 {
                print("iPhone Classic")
            }else if UIScreen.main().nativeBounds.height == 960 {
                
                print("iPhone 4 or 4S")
            }else if UIScreen.main().nativeBounds.height == 1136 {
                
                print("iPhone 5 or 5S or 5C")
            }else if UIScreen.main().nativeBounds.height == 1334 {
                
                nlcLogo.constant = -296
                nlcSlogan.constant = 55
                nlcBtnLogin.constant = 100
                print("iPhone 6")
            }else if UIScreen.main().nativeBounds.height >= 1900 {

                nlcLogo.constant = -326
                nlcSlogan.constant = 70
                nlcBtnLogin.constant = 120
                print("iPhone 6+")
            }else {
                print(UIScreen.main().nativeBounds.height)
            }
            
        } else if UIDevice.current().userInterfaceIdiom == .pad {
            
            nlcLogo.constant = -426
            nlcSlogan.constant = 70
            nlcBtnLogin.constant = 120
            print("iPAd")
            
        }
        
    }


}
