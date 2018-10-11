//
//  RadiansHelper.swift
//  roam-wheely-cool-app
//
//  Created by victor.magpali on 10/11/18.
//  Copyright © 2018 Victor Magpali. All rights reserved.
//

import UIKit

extension Int {
    func toRadians() -> CGFloat {
        return (CGFloat(self) * CGFloat.pi) / 180
    }
}
