//
//  LeftMenuViewController.swift
//  Restaurant
//
//  Created by AppsFoundation on 8/28/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit
//import RealmSwift

class LeftMenuViewController: UIViewController {
    
    @IBOutlet var viewController: UIView!
    @IBOutlet weak var menuTableView: UITableView?
//    let alert = AlertDialogs()
//    let apiFunction = APIFunction()
    let toast = ToastFunction()
//    let apiURL = APIurls()
    
    var window: UIWindow?
    let userImage = UserDefaults.standard()
    
    private var menuItems: [String] = []
    private var menuItemsImages: [String] = []
    private var selectedMenuItemIndex: Int = 0
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet weak var lblFullname: UILabel!
    @IBOutlet weak var lblStorename: UILabel!
    
    var imageCache = [String : UIImage]()
    
    override func viewWillAppear(_ animated: Bool) {
                uiDesign()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuItems = ["Profile","Booking","Payment","Support","About"]
        menuItemsImages = ["menu_icon_profile", "menu_icon_booking", "menu_icon_payment", "menu_icon_support","menu_icon_about"]
        
        checkScreenSize()
        
    }
    
    func checkScreenSize() {
        if UIDevice.current().userInterfaceIdiom == .phone {
            if UIScreen.main().nativeBounds.height == 960 {
                print("iPhone 4 or 4S")
            }
        }
    }
    
    func uiDesign() {
//        viewController.backgroundColor = UIColor(hex: 0x000000)
//        let image = userImage.data(forKey: "userImage")
//        userImageView.image = UIImage(data: image!)
        //        userImageView.image = UIImage.gifWithName("ajax-loader")
        userImageView.layer.cornerRadius = self.userImageView.frame.width/2.1
        userImageView.layer.masksToBounds = true
        
        menuTableView?.contentInset.top = 17
        
        
//        let realm = try! Realm()
//        let dataObject = realm.objects(Data).first
//        
//        lblFullname.text = dataObject?.full_name as? String
//        lblStorename.text = dataObject?.store_name as? String
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UITableViewDataSource
extension LeftMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        
        cell.selectedMenuImageView!.isHidden = selectedMenuItemIndex != indexPath.row
        cell.itemNameLabel?.text = menuItems[indexPath.row]
        cell.itemImageView?.image = UIImage(named: menuItemsImages[indexPath.row])
        
        
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
extension LeftMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let realm = try! Realm()
//        let dataObject = realm.objects(AccessToken).first
//        let token = dataObject?.access_token as? String
        
        
        selectedMenuItemIndex = indexPath.row
        
        switch selectedMenuItemIndex {
        case 0:
            print("1")
            break
        case 1:
            print("2")
            break
        case 2:
            print("3")
            break
        case 3:
            print("4")
            break
        default:
            print("5")
            break
        }
        menuTableView?.reloadData()
    }
    
    
    @IBAction func signOut(_ sender: AnyObject) {
        
//        alert.showLazyAlertController("One Rewards", msg: "Are you sure you want to Sign Out?", actionFrom: "signout_alert", viewController: self)
        
    }
    
}
