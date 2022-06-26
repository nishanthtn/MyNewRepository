//
//  ViewController.swift
//  SampleApp
//
//  Created by Jaldee on 25/06/22.
//

import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate, UITabBarDelegate {

    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var home: UITabBarItem!
    @IBOutlet weak var categories: UITabBarItem!
    @IBOutlet weak var offers: UITabBarItem!
    @IBOutlet weak var cart: UITabBarItem!
    @IBOutlet weak var account: UITabBarItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBar.delegate = self
//        self.cart.isEnabled = true
        self.tabBar.selectedItem = self.home
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
        print(item.tag)
        
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
            if selectedIndex == 0 {
                // do something
            }
        print(selectedIndex)
    }
}

