//
//  BaseViewController.swift
//  Restaurant
//
//  Created by AppsFoundation on 8/27/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//


import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu_button")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(onMenu(_:)))
        
        navigationController?.navigationBar.isTranslucent = true
        
        automaticallyAdjustsScrollViewInsets = false
    }
    
    
    @IBAction func onMenu(_ sender: AnyObject) {
        
        if slidingPanelController.sideDisplayed == MSSPSideDisplayed.left {
            slidingPanelController.closePanel()
        }else {

            slidingPanelController.openLeftPanel()
        }
    }
}
