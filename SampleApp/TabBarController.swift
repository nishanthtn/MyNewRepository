//
//  TabBarController.swift
//  SampleApp
//
//  Created by Jaldee on 25/06/22.
//

import UIKit


class TabBarController: UITabBarController, UITabBarControllerDelegate {
//    TabBarID
    override func viewDidLoad() {
        super.viewDidLoad()
//        tabBar.selectedItem = tabBar.items?[5]
        let navigationController = self.viewControllers![0] as! UINavigationController
        let firstVC = navigationController.viewControllers[0] as! HomeViewController
//        self.openHomeViewController()
        self.hideKeyboardWhenTappedAround()
        
        
        
        // Do any additional setup after loading the view.
        
        
        
        let tabBarItemHome          = tabBar.items![0]
        let tabBarItemCategories    = tabBar.items![1]
        let tabBarItemOffers        = tabBar.items![2]
        let tabBarItemCart          = tabBar.items![3]
        let tabBarItemAccount       = tabBar.items![4]
//        let tabBarItemcpy           = tabBar.items![5]
        

        
        
        tabBarItemHome.title            = "Home"
        tabBarItemCategories.title      = "Categories"
        tabBarItemOffers.title          = "Offers"
        tabBarItemCart.title            = "Cart"
        tabBarItemAccount.title         = "Account"
//        tabBarItemcpy.title             = "Home2"
        
        tabBarItemHome.image    = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        tabBarItemCategories.image = UIImage(named: "categories")?.withRenderingMode(.alwaysOriginal)
        tabBarItemCart.image   = UIImage(named: "cart")?.withRenderingMode(.alwaysOriginal)
        tabBarItemAccount.image = UIImage(named: "account")?.withRenderingMode(.alwaysOriginal)
        tabBarItemOffers.image = UIImage(named: "offers")?.withRenderingMode(.alwaysOriginal)
//        tabBarItemcpy.image = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
