//
//  ToastFunction.swift
//  SmartStaff
//
//  Created by t0tep on 8/1/15.
//  Copyright (c) 2015 SmartStaff. All rights reserved.
//

import Foundation
import UIKit

class ToastFunction: UIViewController {
    
    func showActivity(_ viewController: UIViewController) {
        viewController.view.makeToastActivity()
    }
    
    func showBlackActivity(_ viewController: UIViewController) {
        viewController.view.makeToastActivityBlack()
    }
    
    func hideActivity(_ viewController: UIViewController) {
        viewController.view.hideToastActivity()
    }
    
    func messageToast(_ message: String, viewController: UIViewController) {
        viewController.view.makeToast(message: message)
    }
    
}
