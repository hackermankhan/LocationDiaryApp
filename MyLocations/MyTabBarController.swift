//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by Khandaker Shayel on 10/26/20.
//  Copyright © 2020 Hunter CSCI Student. All rights reserved.
//

import UIKit
class MyTabBarController: UITabBarController {
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  override var childForStatusBarStyle: UIViewController? {
return nil
} }
