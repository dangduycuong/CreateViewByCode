//
//  InfinityLoopLabelView.swift
//  SideMenu
//
//  Created by Cuong on 10/9/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

class InfinityLoopLabelView: UIView {
    private var timeInterval        : TimeInterval!
    private let leadingBuffer       = CGFloat(5.0)
    var paddingLeft                 = CGFloat(16)
    private var spacing             :CGFloat = 50.0
    private var label               : UILabel!
    private var labelClone          : UILabel!
    private var leadingConstraint   : NSLayoutConstraint?
    private var cloneLeadingConstraint   : NSLayoutConstraint?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    var text: String? {
        didSet {
            DispatchQueue.main.async {
                self.setup()
            }
        }
    }
    
    var isTextTooLong: Bool = false
    func setup() {
        reset()
        label = UILabel()
        label.text = text
        label.frame = CGRect.zero
        let sizeOfText = label.sizeThatFits(CGSize.zero)
        isTextTooLong = sizeOfText.width + 16.0 > frame.size.width
        self.addSubview(label)
        leadingConstraint = label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: paddingLeft)
        leadingConstraint?.isActive = true
        label.widthAnchor.constraint(equalToConstant: sizeOfText.width).isActive = true
        
        label.fill(left: nil, top: 0, right: nil, bottom: 0)
        if isTextTooLong {
            labelClone = label.clone()
            self.addSubview(labelClone!)
            labelClone?.fill(left: nil, top: 0, right: nil, bottom: 0)
            cloneLeadingConstraint = labelClone?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:  sizeOfText.width + self.paddingLeft + self.spacing)
            labelClone.widthAnchor.constraint(equalToConstant: sizeOfText.width).isActive = true
            
            cloneLeadingConstraint?.isActive = true
            layoutIfNeeded()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.animate()
            }
        }
        
    }
    
    
    func reset() {
        self.layer.removeAllAnimations()
        label?.removeFromSuperview()
        labelClone?.removeFromSuperview()
        clipsToBounds = true
        labelClone = nil
        label = nil
        animator?.stopAnimation(true)
        animator = nil
    }
    
    var  animator: UIViewPropertyAnimator?
    private func animate() {
        guard isTextTooLong else {return}
        guard let text = text else {return }
        timeInterval = TimeInterval((text.count) / 10)
        self.animator = UIViewPropertyAnimator(duration: self.timeInterval, curve: .linear) {
            self.transform(deltaX: -self.label.bounds.width - self.spacing - self.paddingLeft)
            self.layoutIfNeeded()
        }
        self.animator?.addCompletion { (position) in
            switch position {
            case .end:
                if  self.leadingConstraint!.constant < CGFloat(0) {
                    self.leadingConstraint?.constant = self.label.bounds.width + self.spacing + self.paddingLeft
                } else if self.cloneLeadingConstraint!.constant < CGFloat(0) {
                    self.cloneLeadingConstraint?.constant = self.label.bounds.width + self.spacing + self.paddingLeft
                }
                self.layoutIfNeeded()
                self.animate()
            default:
                return
            }
        }
        self.animator?.startAnimation()
    }
    
    func transform(deltaX: CGFloat) {
        self.leadingConstraint?.constant = self.leadingConstraint!.constant + deltaX
        self.cloneLeadingConstraint?.constant = self.cloneLeadingConstraint!.constant + deltaX
    }
    
    
    
}

// MARK: - UILabel

extension UILabel {
    
    func clone() -> UILabel {
        let label = UILabel()
        label.text = self.text
        label.bounds = self.bounds
        return label
    }
}
