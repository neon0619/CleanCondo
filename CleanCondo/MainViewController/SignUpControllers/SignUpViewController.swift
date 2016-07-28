//
//  SignUpViewController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 12/06/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nlcPageControl: NSLayoutConstraint!
    
    var signUpPageViewController: SignUpPageViewController? {
        didSet {
            signUpPageViewController?.signUpDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: #selector(SignUpViewController.didChangePageControlValue), for: .valueChanged)
        
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
                nlcPageControl.constant = -137
                print("iPhone 6")
            }else if UIScreen.main().nativeBounds.height >= 1900 {
                nlcPageControl.constant = -147
                print("iPhone 6+")
            }else {
                print(UIScreen.main().nativeBounds.height)
            }
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if let signUpPageViewController = segue.destinationViewController as? SignUpPageViewController {
            self.signUpPageViewController = signUpPageViewController
        }
    }
    
    @IBAction func didTapNextButton(_ sender: UIButton) {
        signUpPageViewController?.scrollToNextViewController()
    }
    
    /**
     Fired when the user taps on the pageControl to change its current page.
     */
    func didChangePageControlValue() {
        signUpPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
}

extension SignUpViewController: SignUpPageViewControllerDelegate {
    
    func tutorialPageViewController(_ tutorialPageViewController: SignUpPageViewController,
                                    didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(_ tutorialPageViewController: SignUpPageViewController,
                                    didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
