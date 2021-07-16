//
//  ViewController.swift
//  SideMenu
//
//  Created by MACOS on 7/16/21.
//  Copyright © 2021 Cuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!
    
    @IBOutlet weak var directionButton: UIButton!
    
    lazy private var noDataView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var menuBarButtonItem: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.addTarget(self, action:  #selector(self.hamburgerMenuClicked), for: .touchUpInside)
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        scrollView = UIScrollView()
        let parent = view!
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 0).isActive = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        
        contentView.backgroundColor = .cyan
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        
        contentView.widthAnchor.constraint(equalTo: parent.widthAnchor, constant: 0).isActive = true
        contentView.systemLayoutSizeFitting(.zero, withHorizontalFittingPriority: UILayoutPriority(rawValue: 250), verticalFittingPriority: .defaultHigh)
        
        
        let label = UILabel()
        //        contentView.addSubview(label)
        //        label.translatesAutoresizingMaskIntoConstraints = false
        //
        //        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        //        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        //        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        //        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
        
        label.numberOfLines = 0
        var text = """
        scrollView = UIScrollView()
        let parent = view!
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 0).isActive = true
        
        let contentView = UIView()
        contentView.backgroundColor = .cyan
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
//        contentView.heightAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2, constant: 0).isActive = true
        
        let label = UILabel()
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
"""
        
        text += "Cuong"
        label.text = text
        
        let subView = UIView()
        subView.translatesAutoresizingMaskIntoConstraints = false
        subView.backgroundColor = .red
        subView.addSubview(label)
        subView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.bounds.size.width = 50
        button.bounds.size.height = 50
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.contentMode = .scaleToFill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(subView)
        stackView.addArrangedSubview(button)
        subView.translatesAutoresizingMaskIntoConstraints = false
        //        stackView.isLayoutMarginsRelativeArrangement = true
        //        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 0)
        
        contentView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        
        
        //        button.topAnchor.constraint(equalTo: parent.topAnchor, constant: 32).isActive = true
        //        button.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 32).isActive = true
        //        button.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 0).isActive = true
        //        button.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: 0).isActive = true
        
        //        parent.addSubview(button)
    }
    
    private func setupDirectionButton() {
        directionButton.backgroundColor = #colorLiteral(red: 0.007843137255, green: 0.2470588235, blue: 0.3843137255, alpha: 1)
        directionButton.layer.backgroundColor = UIColor(red: 0.008, green: 0.247, blue: 0.384, alpha: 1).cgColor
        directionButton.layer.cornerRadius = 16
        directionButton.setTitleColor(.white, for: .normal)
        //        directionButton.titleLabel?.font = LatoFont.regular(with: 16)
        directionButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        let paragraphStyle = NSMutableParagraphStyle()
        directionButton.setAttributedTitle(NSMutableAttributedString(string: "Get Direction", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]), for: .normal)
        directionButton.addTarget(self, action: #selector(openMapApp), for: .touchUpInside)
    }
    
    @objc private func showAlert() {
        let vc = AlertViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func openMapApp() {
        noDataView.isHidden = !noDataView.isHidden
    }
    
    @objc func hamburgerMenuClicked() {
        
    }
    
    
}

