//
//  AlertViewController.swift
//  SideMenu
//
//  Created by MACOS on 7/16/21.
//  Copyright © 2021 Cuong. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        let parent = view!
        
        let coverButton = UIButton()
        coverButton.translatesAutoresizingMaskIntoConstraints = false
        
        parent.addSubview(coverButton)
        
        coverButton.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0).isActive = true
        coverButton.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0).isActive = true
        coverButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
        coverButton.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 0).isActive = true
        
        coverButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        
        let contentView = UIView()
        contentView.backgroundColor = .green
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 10
        contentView.layer.cornerRadius = 16
        
        
        parent.addSubview(contentView)
        
        contentView.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 32).isActive = true
        contentView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -32).isActive = true
        
        contentView.systemLayoutSizeFitting(.zero, withHorizontalFittingPriority: UILayoutPriority(rawValue: 250), verticalFittingPriority: .defaultHigh)
        
        
        
        let titleLabel = UILabel()
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Notice"
        
        contentView.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .black
        contentView.addSubview(lineView)
        
        lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let messageLabel = UILabel()
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        messageLabel.text = "Notice is failure"
        
        contentView.addSubview(messageLabel)
        
        messageLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 32).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        
        let lineView2 = UIView()
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        lineView2.backgroundColor = .black
        contentView.addSubview(lineView2)
        
        lineView2.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 32).isActive = true
        lineView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        lineView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        let okButton = UIButton()
        okButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.setTitle("OK", for: .normal)
        
        contentView.addSubview(okButton)
        
        okButton.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 0).isActive = true
        okButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        okButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        okButton.addTarget(self, action: #selector(okClicked), for: .touchUpInside)
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func okClicked() {
        dismiss(animated: true, completion: nil)
    }
    
}
