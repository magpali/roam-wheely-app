//
//  SpinWheelView.swift
//  roam-wheely-cool-app
//
//  Created by victor.magpali on 10/11/18.
//  Copyright © 2018 Victor Magpali. All rights reserved.
//

import UIKit

class SpinWheelView: UIView {

    private let wheelView: WheelView
    private let triangleView: TriangleView
    private let spinButton: UIButton
    
    init(options: [String], wheelDiameter: CGFloat) {
        self.wheelView = WheelView(options: options, diameter: wheelDiameter)
        self.triangleView = TriangleView(frame: CGRect(x: 50, y: 50, width: 40, height: 40))
        self.spinButton = UIButton(frame: .zero)
        
        super.init(frame: .zero)
        
        _ = self.addSubviews()
            .setupConstraints()
            .configViews()
            .addActions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() -> SpinWheelView {
        addSubview(wheelView)
        addSubview(triangleView)
        addSubview(spinButton)
        
        return self
    }
    
    private func setupConstraints() -> SpinWheelView {
        wheelView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        wheelView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        triangleView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        triangleView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        triangleView.centerYAnchor.constraint(equalTo: wheelView.centerYAnchor).isActive = true
        triangleView.trailingAnchor.constraint(equalTo: wheelView.trailingAnchor, constant: 10).isActive = true
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        
        spinButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        spinButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        spinButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        spinButton.translatesAutoresizingMaskIntoConstraints = false
        
        return self
    }
    
    private func configViews() -> SpinWheelView {
        spinButton.setTitle("SPIN", for: .normal)
        return self
    }
    
    private func addActions() -> SpinWheelView {
        spinButton.addTarget(self, action: #selector(spinWheel), for: .touchUpInside)
        return self
    }
    
    @objc private func spinWheel() {
        wheelView.randomSpin()
    }

}
