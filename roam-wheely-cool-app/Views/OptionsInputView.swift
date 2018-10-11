//
//  OptionsInputView.swift
//  roam-wheely-cool-app
//
//  Created by victor.magpali on 10/11/18.
//  Copyright © 2018 Victor Magpali. All rights reserved.
//

import UIKit

protocol OptionInputProtocol: UITableViewDelegate, UITableViewDataSource {
    func addOption(option: String)
    func doneAction()
}

class OptionsInputView: UIView {

    private let cellReuseIdentifier = "tableViewCell"
    
    private var optionTextField = UITextField()
    private var addOptionButton = UIButton(frame: .zero)
    private var optionsTableView = UITableView()
    private var doneButton = UIButton(frame: .zero)

    weak var optionInputDelegate: OptionInputProtocol?
    
    init(delegate: OptionInputProtocol) {
        optionInputDelegate = delegate
        
        super.init(frame: .zero)
        
        _ = self.registerDelegates()
                .addSubviews()
                .setupConstraints()
                .configView()
                .addActions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func getCellFor(option: String) -> UITableViewCell {
        let cell = optionsTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) ?? UITableViewCell()
        cell.textLabel?.text = option
        cell.backgroundColor = .clear
        return cell
    }
    
    public func reloadOptions() {
        optionsTableView.reloadData()
        
    }
    
    private func registerDelegates() -> OptionsInputView {
        optionTextField.delegate = self
        optionsTableView.delegate = optionInputDelegate
        optionsTableView.dataSource = optionInputDelegate
        optionsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        return self
    }
    
    private func addSubviews() -> OptionsInputView {
        addSubview(optionTextField)
        addSubview(addOptionButton)
        addSubview(optionsTableView)
        addSubview(doneButton)
        return self
    }
    
    private func setupConstraints() -> OptionsInputView {
        
        optionTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        optionTextField.topAnchor.constraint(equalTo: topAnchor, constant: 64).isActive = true
        optionTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        optionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        addOptionButton.centerYAnchor.constraint(equalTo: optionTextField.centerYAnchor).isActive = true
        addOptionButton.leadingAnchor.constraint(equalTo: optionTextField.trailingAnchor, constant: 8).isActive = true
        addOptionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        addOptionButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        addOptionButton.translatesAutoresizingMaskIntoConstraints = false
        
        optionsTableView.topAnchor.constraint(equalTo: optionTextField.bottomAnchor, constant: 32).isActive = true
        optionsTableView.leadingAnchor.constraint(equalTo: optionTextField.leadingAnchor).isActive = true
        optionsTableView.trailingAnchor.constraint(equalTo: addOptionButton.trailingAnchor).isActive = true
        optionsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        doneButton.topAnchor.constraint(equalTo: optionsTableView.bottomAnchor, constant: 32).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: optionsTableView.leadingAnchor).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: optionsTableView.trailingAnchor).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        return self
    }
    
    private func configView() -> OptionsInputView {
        optionTextField.backgroundColor = .white
        optionTextField.placeholder = "Insert Option"
        optionTextField.returnKeyType = .continue
        addOptionButton.setTitle("ADD", for: .normal)
        doneButton.setTitle("DONE", for: .normal)
        optionsTableView.tableFooterView = UIView()
        optionsTableView.backgroundColor = .clear
        backgroundColor = .lightGray
        
        return self
    }
    
    private func addActions() -> OptionsInputView {
        addOptionButton.addTarget(self, action: #selector(addOption), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
        return self
    }
    
    @objc private func addOption() {
        guard let text = optionTextField.text,
            !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        optionTextField.text = nil
        optionInputDelegate?.addOption(option: text)
    }
    
    @objc private func doneAction() {
        optionInputDelegate?.doneAction()
    }
    
    @objc private func dismissKeyboard() {
        optionTextField.resignFirstResponder()
    }

}

extension OptionsInputView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addOption()
        return true
    }
    
}
