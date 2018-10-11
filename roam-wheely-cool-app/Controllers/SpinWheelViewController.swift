//
//  SpinWheelViewController.swift
//  roam-wheely-cool-app
//
//  Created by victor.magpali on 10/11/18.
//  Copyright © 2018 Victor Magpali. All rights reserved.
//

import UIKit

class SpinWheelViewController: UIViewController {
    
    private let options: [String]
    
    init(options: [String]) {
        self.options = options
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        let spinWheel = WheelView(options: options, diameter: 300)
        view.addSubview(spinWheel)
        spinWheel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinWheel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
}
