//
//  PaymentViewController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 28/07/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    
    @IBOutlet weak var nlcPayment: NSLayoutConstraint!
    @IBOutlet weak var nlcCreditCard: NSLayoutConstraint!
    @IBOutlet weak var nlcButton: NSLayoutConstraint!
    
    @IBOutlet weak var txtCreditCard: UITextField!
    @IBOutlet weak var txtCvv: UITextField!
    @IBOutlet weak var txtMonth: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDesign()

    }
    
    
    func appDesign() {
        
        padding(txtField: txtCreditCard)
        padding(txtField: txtCvv)
        padding(txtField: txtMonth)
        padding(txtField: txtYear)
        
        if UIDevice.current().userInterfaceIdiom == .phone {
            if UIScreen.main().nativeBounds.height == 480 {
                print("iPhone Classic")
            }else if UIScreen.main().nativeBounds.height == 960 {
                
                print("iPhone 4 or 4S")
            }else if UIScreen.main().nativeBounds.height == 1136 {
                
                print("iPhone 5 or 5S or 5C")
            }else if UIScreen.main().nativeBounds.height == 1334 {
                nlcPayment.constant = 70
                nlcCreditCard.constant = 30 + 15
                nlcButton.constant = 141 + 15
                print("iPhone 6")
            }else if UIScreen.main().nativeBounds.height >= 1900 {
                nlcPayment.constant = 80
                nlcCreditCard.constant = 30 + 20
                nlcButton.constant = 141 + 20
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
