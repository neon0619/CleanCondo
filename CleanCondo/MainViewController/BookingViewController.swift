//
//  BookingViewController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 13/06/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit
import Crashlytics


class BookingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func crashTriggered(_ sender: AnyObject) {
        Crashlytics.sharedInstance().crash()
    }


    @IBAction func anImportantUserAction(_ sender: AnyObject) {
        
        // TODO: Track the user action that is important for you.
        Answers.logContentView(withName: "Tweet", contentType: "Video", contentId: "1234", customAttributes: ["Favorites Count":20, "Screen Orientation":"Landscape"])

        
        
        // TODO: Move this method and customize the name and parameters to track your key metrics
        //       Use your own string attributes to track common values over time
        //       Use your own number attributes to track median value over time
        Answers.logCustomEvent(withName: "Tried Answers", customAttributes: ["Category":"Comedy", "Length":350])
    }
}
