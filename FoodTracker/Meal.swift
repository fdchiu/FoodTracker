//
//  Meal.swift
//  FoodTracker
//
//  Created by David Chiu on 6/1/19.
//  Copyright © 2019 David Chiu. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    //MARK: Property

    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    //MARK: Archiving path
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDirectory.appendingPathComponent("meals")
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        if(name.isEmpty) {
            return nil
        }
        guard (rating>=0 && rating<=5) else {
            return nil
        }
    }
    
    //MARK: Nscoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
            
        let rating = aDecoder.decodeObject(forKey: PropertyKey.rating) as? Int ?? 0
        
        self.init(name: name, photo: photo, rating: rating)
    }
    
    //MARK: Private methods
    
}
