//
//  SignUpItemController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 12/06/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class SignUpItemController: UIViewController {
    
    
    @IBOutlet var contentImageView: UIImageView?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtFname: UITextField!
    @IBOutlet weak var txtLname: UITextField!
    @IBOutlet weak var txtEmailAdd: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var deviceConstraints: NSLayoutConstraint!
    
    var itemIndex: Int = 0
    var imageName: String = "" {
        
        didSet {
            
            if let imageView = contentImageView {
                imageView.image = UIImage(named: imageName)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView!.image = UIImage(named: imageName)
        
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignUpItemController.hideKeyboard))
        tapGesture.cancelsTouchesInView = false
//        scrollView.addGestureRecognizer(tapGesture)
        

//        appDesign()
        
    }
    
    func appDesign() {
        
        if UIDevice.current().userInterfaceIdiom == .phone {
            if UIScreen.main().nativeBounds.height == 480 {
                print("iPhone Classic")
            }else if UIScreen.main().nativeBounds.height == 960 {
                deviceConstraints.constant = 65
                print("iPhone 4 or 4S")
            }else if UIScreen.main().nativeBounds.height == 1136 {
                deviceConstraints.constant = 105
                print("iPhone 5 or 5S or 5C")
            }else if UIScreen.main().nativeBounds.height == 1334 {
                deviceConstraints.constant = 150
                print("iPhone 6")
            }else if UIScreen.main().nativeBounds.height >= 1900 {
                deviceConstraints.constant = 170
                print("iPhone 6+")
            }else {
                print(UIScreen.main().nativeBounds.height)
            }
            
        }
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.deregisterFromKeyboardNotifications()
        super.viewWillDisappear(true)
        
    }
    
    func registerForKeyboardNotifications() -> Void {
        NotificationCenter.default().addObserver(self, selector: #selector(SignUpItemController.keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default().addObserver(self, selector: #selector(SignUpItemController.keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    func deregisterFromKeyboardNotifications() -> Void {
        NotificationCenter.default().addObserver(self, selector: #selector(SignUpItemController.keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        NotificationCenter.default().addObserver(self, selector: #selector(SignUpItemController.keyboardWasShown(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(_ notification: Notification) {
        var info: Dictionary = (notification as NSNotification).userInfo!
        let keyboardSize: CGSize = (info[UIKeyboardFrameBeginUserInfoKey]?.cgRectValue.size)!
        var visibleRect: CGRect = self.view.frame
        visibleRect.size.height -= keyboardSize.height
        
        
        if self.txtFname.isFirstResponder() == true {
            keyboardUnderOutlet(visibleRect, outletOrigin: txtLname.frame.origin, outletHeight: txtLname.frame.size.height)
            txtFname.placeholder = ""
        }else if self.txtLname.isFirstResponder() == true {
            keyboardUnderOutlet(visibleRect, outletOrigin: txtEmailAdd.frame.origin, outletHeight: txtEmailAdd.frame.size.height)
            txtLname.placeholder = ""
        }else if self.txtEmailAdd.isFirstResponder() == true {
            keyboardUnderOutlet(visibleRect, outletOrigin: txtPassword.frame.origin, outletHeight: txtPassword.frame.size.height)
            txtEmailAdd.placeholder = ""
        }else if self.txtPassword.isFirstResponder() == true {
            keyboardUnderOutlet(visibleRect, outletOrigin: txtConfirmPassword.frame.origin, outletHeight: txtConfirmPassword.frame.size.height)
            txtPassword.placeholder = ""
        }else if self.txtConfirmPassword.isFirstResponder() == true {
            keyboardUnderOutlet(visibleRect, outletOrigin: btnSignUp.frame.origin, outletHeight: btnSignUp.frame.size.height)
            txtConfirmPassword.placeholder = ""
        }else {
            print("Selected None")
        }
        
    }
    
    
    func keyboardUnderOutlet(_ rect: CGRect, outletOrigin: CGPoint, outletHeight: CGFloat) {
        if (!rect.contains(outletOrigin)) {
            let scrollPoint: CGPoint = CGPoint(x: 0.0, y: outletOrigin.y - rect.size.height + outletHeight)
            self.scrollView.setContentOffset(scrollPoint, animated: true)
        }
    }
    
    
    func hideKeyboard() {
        txtFname.resignFirstResponder()   //FirstResponder's must be resigned for hiding keyboard.
        txtLname.resignFirstResponder()
        txtEmailAdd.resignFirstResponder()
        txtPassword.resignFirstResponder()
        txtConfirmPassword.resignFirstResponder()
        self.scrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
}
