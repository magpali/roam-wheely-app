//
//  WheelView.swift
//  roam-wheely-cool-app
//
//  Created by victor.magpali on 10/11/18.
//  Copyright © 2018 Victor Magpali. All rights reserved.
//

import UIKit

class WheelView: UIView {

    private let diameter: CGFloat
    private let options: [String]
    
    init(options: [String], diameter: CGFloat) {
        self.diameter = diameter
        self.options = options
        super.init(frame: .zero)
        drawWheel()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(randomSpin))
        self.addGestureRecognizer(gesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawWheel() {
        
        backgroundColor = .purple
        clipsToBounds = true
        
        widthAnchor.constraint(equalToConstant: diameter).isActive = true
        heightAnchor.constraint(equalToConstant: diameter).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = diameter/2
        
        var count = 1;
        
        for option in options {
            let label = UILabel()
            label.text = option
            
            addSubview(label)
            label.textColor = .white
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textAlignment = .right
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
            label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            label.translatesAutoresizingMaskIntoConstraints = false
            
            let rotationAngle = (360/options.count) * count
            label.transform = CGAffineTransform(rotationAngle: rotationAngle.toRadians())
            count += 1;
        }
    }
    
    private func spin360(completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {
            self.transform = CGAffineTransform(rotationAngle: 180.toRadians())
        }) { complete in
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {
                self.transform = CGAffineTransform(rotationAngle: 360.toRadians())
            }) { complete in
                if let completion = completion {
                    completion(complete)
                }
            }
        }
    }
    
    @objc public func randomSpin() {
        
        spin360 { (complete) in
            self.spin360 { (complete) in
                self.spin360 { (complete) in
                    let randomAngle = Int(arc4random_uniform(359))
                    if randomAngle < 180 {
                        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
                            self.transform = CGAffineTransform(rotationAngle: randomAngle.toRadians())
                        })
                    } else {
                        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {
                            self.transform = CGAffineTransform(rotationAngle: 180.toRadians())
                        }) { complete in
                            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
                                self.transform = CGAffineTransform(rotationAngle: randomAngle.toRadians())
                            })
                        }
                    }
                }
            }
        }
    }

}
