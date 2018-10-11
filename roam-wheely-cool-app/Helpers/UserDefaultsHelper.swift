//
//  UserDefaultsHelper.swift
//  roam-wheely-cool-app
//
//  Created by victor.magpali on 10/11/18.
//  Copyright © 2018 Victor Magpali. All rights reserved.
//

import UIKit

class UserDefaultsHelper: NSObject {
    
    static private var optionsKey = "optionsKey"
    
    static var options: [String] {
        get {
            return UserDefaults.standard.value(forKey: optionsKey) as? [String] ?? []
        }
        set (newValue) {
            UserDefaults.standard.setValue(newValue, forKey: optionsKey)
        }
    }

}
