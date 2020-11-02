//
//  Location+CoreDataClass.swift
//  MyLocations
//
//  Created by Khandaker Shayel on 10/14/20.
//  Copyright © 2020 Hunter CSCI Student. All rights reserved.
//
//

import Foundation
import CoreData
import MapKit

@objc(Location)
public class Location: NSManagedObject, MKAnnotation  {
    public var coordinate: CLLocationCoordinate2D {
      return CLLocationCoordinate2DMake(latitude, longitude)
    }
    public var title: String? {
      if locationDescription.isEmpty {
        return "(No Description)"
      } else {
        return locationDescription
      }
    }
    public var subtitle: String? {
      return category
    }
    
     var hasPhoto: Bool {
      return photoID != nil
    }
    
    var photoURL: URL {
      assert(photoID != nil, "No photo ID set")
      let filename = "Photo-\(photoID!.intValue).jpg"
      return applicationDocumentsDirectory.appendingPathComponent(filename)
    }
    
     var photoImage: UIImage? {
      return UIImage(contentsOfFile: photoURL.path)
    }
    
    class func nextPhotoID() -> Int {
        let userDefaults = UserDefaults.standard
        let currentID = userDefaults.integer(forKey: "PhotoID") + 1
        userDefaults.set(currentID, forKey: "PhotoID")
        userDefaults.synchronize()
        return currentID
    }
    
    func removePhotoFile() {
      if hasPhoto {
        do {
          try FileManager.default.removeItem(at: photoURL)
        } catch {
              print("Error removing file: \(error)")
            }
        }
        
    }
}
