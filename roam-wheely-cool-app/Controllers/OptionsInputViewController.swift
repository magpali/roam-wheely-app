//
//  OptionsInputViewController.swift
//  roam-wheely-cool-app
//
//  Created by victor.magpali on 10/11/18.
//  Copyright © 2018 Victor Magpali. All rights reserved.
//

import UIKit

class OptionsInputViewController: UIViewController {
    
    private var optionsInputView: OptionsInputView?
    private var options: [String] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
        optionsInputView = OptionsInputView(delegate: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.addSubviews()
                .setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func addSubviews() -> OptionsInputViewController {
        guard let inputView = optionsInputView else { return self }
        view.addSubview(inputView)
        return self
    }
    
    private func setupConstraints() -> OptionsInputViewController {
        guard let inputView = optionsInputView else { return self }
        inputView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        inputView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        inputView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        inputView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        inputView.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
}

extension OptionsInputViewController: OptionInputProtocol {
    
    func doneAction() {
        let spinWheelViewController = SpinWheelViewController(options: options)
        navigationController?.pushViewController(spinWheelViewController, animated: true)
    }
    
    func addOption(option: String) {
        options.append(option)
        optionsInputView?.reloadOptions()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let position = options.count - 1 - indexPath.row
        guard options.indices.contains(position),
            let inputView = optionsInputView else { return UITableViewCell() }
        
        return inputView.getCellFor(option: options[position])
    }
    
}
