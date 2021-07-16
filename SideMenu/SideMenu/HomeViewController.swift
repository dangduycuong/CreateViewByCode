//
//  HomeViewController.swift
//  SideMenu
//
//  Created by Cuong on 10/9/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

import UIKit

protocol HomeViewControllerDelegate: class {
    var isLeftSlideMenuOpen: Bool {get set}
}

class HomeViewController: UIViewController {
    
    @IBOutlet var workingSelectionView: WorkingSelectionView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var selectedWorkingTypeContainerView: UIView!
    
    
    @IBOutlet weak var addressLabel: InfinityLoopLabelView!
    
    var selectedWorkingType: WorkingType? {
        didSet {
            guard let _ = selectedWorkingType else {return }
            selectedWorkingTypeContainerView.backgroundColor = UIColor.red
            
        }
    }
    
    
    
    var delegate: HomeViewControllerDelegate?
    
    
    
    var zoomLevel: Float = 15.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWorkingSelectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        workingSelectionView.isOpen = false
    }
    
    func createView(_ subView: UIView, _ superView: UIView, _ colorView: UIColor, _ eye: Bool) {
        
        // Change UIView background colour
        subView.backgroundColor = colorView
        
        // Add rounded corners to UIView
        if eye == true {
            let x = superView.frame.size.width / 4
            let y = superView.frame.size.height / 4
            subView.frame.size.width = superView.frame.size.height / 2
            subView.frame.size.height = superView.frame.size.height / 2
            
            subView.frame = CGRect(x: x, y: y, width: x, height: x)
//            subView.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
//            subView.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        } else {
            subView.frame = CGRect(x: superView.bounds.width / 4, y: superView.bounds.height / 4, width: superView.bounds.width / 2, height: superView.bounds.height / 2)
        }
        subView.layer.cornerRadius = subView.bounds.width / 2
        
        // Add border to UIView
        subView.layer.borderWidth = 1
        
        // Change UIView Border Color to Red
        subView.layer.borderColor = UIColor.blue.cgColor
        
        // Add UIView as a Subview
        superView.addSubview(subView)
    }
    
    func hidenView(_ view: UIView) {
        view.isHidden = true
    }
    
    @IBAction func onClickedHidenView(_ sender: UIButton) {
        
    }
    
    @IBAction func createNewView(_ sender: UIButton) {
        let myNewView = UIView()
        let subView = UIView()
        createView(myNewView, containerView, .gray, false)
        createView(subView, myNewView, .blue, true)
////        let myNewView=UIView(frame: CGRect(x: UIScreen.main.bounds.width / 2, y:  UIScreen.main.bounds.height / 2, width: 300, height: 200))
//        myNewView.frame = CGRect(x: containerView.bounds.width / 4, y: containerView.bounds.height / 4, width: containerView.bounds.width / 2, height: containerView.bounds.height / 2)
//
//        // Change UIView background colour
//        myNewView.backgroundColor=UIColor.lightGray
//
//        // Add rounded corners to UIView
//        myNewView.layer.cornerRadius=25
//
//        // Add border to UIView
//        myNewView.layer.borderWidth=2
//
//        // Change UIView Border Color to Red
//        myNewView.layer.borderColor = UIColor.red.cgColor
//
//        // Add UIView as a Subview
////        self.view.addSubview(myNewView)
//        containerView.addSubview(myNewView)
    }
    
    
    // MARK: Navigation
    
    @IBAction func onClickedMenu(_ sender: Any) {
        NotificationCenter.default.post(name: .toggle, object: nil, userInfo: nil)
        
        let vc = ViewController()
        vc.modalPresentationStyle = .overFullScreen
        title = ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

