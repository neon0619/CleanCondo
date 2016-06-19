//
//  SignUpViewController.swift
//  CleanCondo
//
//  Created by --=_t0tep_=-- on 12/06/2016.
//  Copyright © 2016 --=_t0tep_=--. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIPageViewControllerDataSource, UINavigationControllerDelegate {
    
    private var pageViewController: UIPageViewController?
    private let contentImages = ["help1", "help2", "help3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPageViewController()
        setupPageControl()

    }
    
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewController(withIdentifier: "SignUpPageController") as! UIPageViewController
        pageController.dataSource = self

        if contentImages.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers((startingViewControllers as! [UIViewController]), direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
            
        }
        
        pageViewController = pageController
        pageViewController!.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
    }
    
    
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.lightGray()
        appearance.currentPageIndicatorTintColor = UIColor.darkGray()
        appearance.backgroundColor = UIColor.clear()
    }


    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! SignUpItemController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! SignUpItemController
 
        
        if itemController.itemIndex+1 < contentImages.count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }
    
    
    
    private func getItemController(_ itemIndex: Int) -> SignUpItemController? {
        
        
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard!.instantiateViewController(withIdentifier: "SignUpItemController") as! SignUpItemController
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]
            
            return pageItemController
        }
        
        return nil
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return contentImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }


}
