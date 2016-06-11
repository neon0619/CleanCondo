//
//  LoginViewController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 11/06/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
//    let alert = AlertDialogs()
//    let toast = ToastFunction()
//    let apiUrl = APIurls()
//    let apiFunction = APIFunction()
//    var loginViewModel = LoginViewModel()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var btnSignin: UIButton!
    @IBOutlet weak var deviceConstraint: NSLayoutConstraint!
    
    var window: UIWindow?
    let loginStatus = NSUserDefaults.standardUserDefaults()
    let storedPassword = NSUserDefaults.standardUserDefaults()
    let deviceToken = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(tapGesture)
        
        self.loginStatus.setValue("successful", forKey: "loginStatus")
        appDesign()
    }
    
    
    func appDesign() {
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            if UIScreen.mainScreen().nativeBounds.height == 480 {
                print("iPhone Classic")
            }else if UIScreen.mainScreen().nativeBounds.height == 960 {
                deviceConstraint.constant = 10
                print("iPhone 4 or 4S")
            }else if UIScreen.mainScreen().nativeBounds.height == 1136 {
                deviceConstraint.constant = 78
                print("iPhone 5 or 5S or 5C")
            }else if UIScreen.mainScreen().nativeBounds.height == 1334 {
                deviceConstraint.constant = 125
                print("iPhone 6")
            }else if UIScreen.mainScreen().nativeBounds.height >= 1900 {
                deviceConstraint.constant = 150
                print("iPhone 6+")
            }else {
                print(UIScreen.mainScreen().nativeBounds.height)
            }
            
        }
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.registerForKeyboardNotifications()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.deregisterFromKeyboardNotifications()
        super.viewWillDisappear(true)
        
    }
    
    func registerForKeyboardNotifications() -> Void {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWasShown(_:)), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWasShown(_:)), name: UIKeyboardWillShowNotification, object: nil)
    }
    
    func deregisterFromKeyboardNotifications() -> Void {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWasShown(_:)), name: UIKeyboardDidHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWasShown(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    
    func keyboardWasShown(notification: NSNotification) {
        var info: Dictionary = notification.userInfo!
        let keyboardSize: CGSize = (info[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue.size)!
        let buttonOrigin: CGPoint = self.btnSignin.frame.origin
        let buttonHeight: CGFloat = self.btnSignin.frame.size.height
        var visibleRect: CGRect = self.view.frame
        visibleRect.size.height -= keyboardSize.height
        
        if (!CGRectContainsPoint(visibleRect, buttonOrigin)) {
            let scrollPoint: CGPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight + 4)
            self.scrollView.setContentOffset(scrollPoint, animated: true)
        }
    }
    
    
    
    
    //    func keyboardWasShown(notification: NSNotification) {
    //
    //        var info: Dictionary = notification.userInfo!
    //        let keyboardSize: CGSize = (info[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue.size)!
    //        var visibleRect: CGRect = self.view.frame
    //        visibleRect.size.height -= keyboardSize.height
    //
    //        keyboardUnderOutlet(visibleRect, outletOrigin: btnSignin.frame.origin, outletHeight: btnSignin.frame.size.height)
    //
    //        print("keyboardWasShown")
    //    }
    //
    //    func keyboardUnderOutlet(rect: CGRect, outletOrigin: CGPoint, outletHeight: CGFloat) {
    //        if (!CGRectContainsPoint(rect, outletOrigin)) {
    //            let scrollPoint: CGPoint = CGPointMake(0.0, outletOrigin.y - rect.size.height + outletHeight + 5)
    //            self.scrollView.setContentOffset(scrollPoint, animated: true)
    //        }
    //    }
    
    
    func hideKeyboard() {
        print("keyboardWasHidden")
        userName.resignFirstResponder()   //FirstResponder's must be resigned for hiding keyboard.
        passWord.resignFirstResponder()
        self.scrollView.setContentOffset(CGPointZero, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    @IBAction func loginAction(sender: AnyObject) {
//        
//        toast.showBlackActivity(self)
//        if ConnectionDetector.isConnectedToNetwork() {
//            print("connected")
//            login()
//        }else {
//            print("not connected")
//            alert.showLazyAlertController("One Rewards", msg: "No Internet Connection", actionFrom: "login_alert", viewController: self)
//            toast.hideActivity(self)
//        }
//    }
    
    
//    func login() {
//        hideKeyboard()
//        
//        if userName.text == "" && passWord.text == "" {
//            print("no username and password")
//            dispatch_async(dispatch_get_main_queue(), {
//                self.alert.showLazyAlertController("One Rewards", msg: "Please enter username and password", actionFrom: "login_alert", viewController: self)
//                self.toast.hideActivity(self)
//            })
//        }else if userName.text == "" {
//            print("username empty")
//            dispatch_async(dispatch_get_main_queue(), {
//                self.alert.showLazyAlertController("One Rewards", msg: "Please enter your username.", actionFrom: "login_alert", viewController: self)
//                self.toast.hideActivity(self)
//            })
//        }else if passWord.text == "" {
//            print("password empty")
//            dispatch_async(dispatch_get_main_queue(), {
//                self.alert.showLazyAlertController("One Rewards", msg: "Please enter your password.", actionFrom: "login_alert", viewController: self)
//                self.toast.hideActivity(self)
//            })
//            
//        }else {
//            //            let buyerToken = self.deviceToken.stringForKey("deviceToken")
//            let simulatorToken = "sampleSimulatorToken"
//            
//            
//            scrollView.userInteractionEnabled = false
//            apiFunction.postLogin(["username": userName.text, "password": passWord.text, "grant_type": "password", "client_id": "test", "client_secret": "test", "device_token": "\(simulatorToken)"], url: apiUrl.loginURL) { (message, access_token, token_type, expires_in) -> () in
//                
//                print("acces_token = \(access_token)")
//                
//                if message == "success" {
//                    dispatch_async(dispatch_get_main_queue(), {
//                        self.apiFunction.getUserInfo(self.apiUrl.userInfoURL, token: access_token, postCompleted: { (message) -> () in
//                            if message == "completed" {
//                                
//                                self.apiFunction.getBalance(self.apiUrl.baseURL+"me", token: access_token, postCompleted: { (message, credits, sales) -> () in
//                                    
//                                    if message == "Success" {
//                                        dispatch_async(dispatch_get_main_queue(), {
//                                            
//                                            self.performSegueWithIdentifier("toHomeMenu", sender: self)
//                                            
//                                            self.loginStatus.stringForKey("loginStatus")
//                                            self.loginStatus.setValue("successful", forKey: "loginStatus")
//                                            self.toast.hideActivity(self)
//                                            self.scrollView.userInteractionEnabled = true
//                                            
//                                            self.storedPassword.stringForKey("passWord")
//                                            self.storedPassword.setValue(self.passWord.text, forKey: "passWord")
//                                            
//                                        })
//                                    }else if message == "access_denied" {
//                                        return
//                                    }
//                                })
//                                
//                            }else if message == "access_denied" {
//                                return
//                            }
//                        })
//                    })
//                    
//                    dispatch_async(dispatch_get_main_queue(), {
//                        self.apiFunction.getProducts(self.apiUrl.getProducts, token: access_token, postCompleted: { (message, products) -> () in
//                            if message == "access_denied" {
//                                return
//                            }
//                        })
//                    })
//                    
//                    dispatch_async(dispatch_get_main_queue(), {
//                        self.apiFunction.getProducts(self.apiUrl.getFavoriteContacts, token: access_token, postCompleted: { (message, products) -> () in
//                            if message == "access_denied" {
//                                return
//                            }
//                        })
//                        
//                    })
//                    
//                }else if message == "The user credentials were incorrect." {
//                    dispatch_async(dispatch_get_main_queue(), {
//                        self.alert.showLazyAlertController("One Rewards", msg: message, actionFrom: "login_alert", viewController: self)
//                        self.loginStatus.stringForKey("loginStatus")
//                        self.loginStatus.setValue("unsuccessful", forKey: "loginStatus")
//                        self.toast.hideActivity(self)
//                        self.scrollView.userInteractionEnabled = true
//                    })
//                    
//                }else {
//                    dispatch_async(dispatch_get_main_queue(), {
//                        self.alert.showLazyAlertController("One Rewards", msg: message, actionFrom: "login_alert", viewController: self)
//                        self.loginStatus.stringForKey("loginStatus")
//                        self.loginStatus.setValue("unsuccessful", forKey: "loginStatus")
//                        self.toast.hideActivity(self)
//                        self.scrollView.userInteractionEnabled = true
//                    })
//                }
//            }
//        }
//    }
}

