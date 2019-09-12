//
//  AppCoordinator.swift
//  StudioMosaicAssignment
//
//  Created by alice singh on 11/09/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    static var shared = AppCoordinator()
    
    var window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    private init() { }
    
    func start() {
       gotoHome()
    }
    
    func gotoHome() {
        let home = HomeController()
        let homeNav = UINavigationController(rootViewController: home)
        self.window.rootViewController = homeNav
        self.window.makeKeyAndVisible()
    }
}

