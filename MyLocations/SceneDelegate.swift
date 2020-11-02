//
//  SceneDelegate.swift
//  MyLocations
//
//  Created by Khandaker Shayel on 10/3/20.
//  Copyright © 2020 Hunter CSCI Student. All rights reserved.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (storeDescription, error)
            in
          if let error = error {
            fatalError("Could not load data store: \(error)")
          }
    }
        return container
      }()
    
    lazy var managedObjectContext: NSManagedObjectContext =
                         persistentContainer.viewContext
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let tabController = window!.rootViewController
                                  as! UITabBarController
          if let tabViewControllers = tabController.viewControllers {
            // First tab
            var navController = tabViewControllers[0]
                                as! UINavigationController
            let controller1 = navController.viewControllers.first
                              as! CurrentLocationViewController
            controller1.managedObjectContext = managedObjectContext
            // Second tab
            navController = tabViewControllers[1]
                            as! UINavigationController
            let controller2 = navController.viewControllers.first
                              as! LocationsViewController
            controller2.managedObjectContext = managedObjectContext
            let _ = controller2.view
            // Third tab
            navController = tabViewControllers[2] as! UINavigationController
            let controller3 = navController.viewControllers.first
                              as! MapViewController
            controller3.managedObjectContext = managedObjectContext
          }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

