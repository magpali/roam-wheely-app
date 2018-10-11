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
        
        configViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func configViews() {
        view.backgroundColor = .lightGray
        let spinWheelView = SpinWheelView(options: options, wheelDiameter: view.bounds.width - 32)
        view.addSubview(spinWheelView)
        spinWheelView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        spinWheelView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        spinWheelView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        spinWheelView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        spinWheelView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
