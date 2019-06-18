//
//  IconTextField.swift
//  Companion
//
//  Created by Joey Zhang on 12/6/2019.
//  Copyright © 2019 TGI. All rights reserved.
//

import UIKit

@IBDesignable class IconTextField: UITextField {
    
    var leftIconView: UIImageView? = nil
    var rightIconView: UIImageView? = nil
    
    let border = CALayer()

    @IBInspectable public var leftIcon: UIImage? = nil {
        didSet { update() }
    }
    
    @IBInspectable public var rightIcon: UIImage? = nil {
        didSet { update() }
    }
    
    @IBInspectable public var borderColor: UIColor = UIColor.darkGray {
        didSet { update() }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 1.0 {
        didSet { update() }
    }
    
    fileprivate func update() {
        border.borderWidth = borderWidth
        border.borderColor = borderColor.cgColor
        border.frame = CGRect(x: 0, y: bounds.height - borderWidth, width: bounds.width, height: bounds.height)
        
        self.borderStyle = .none
        self.layer.sublayers?.removeAll()
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        if leftIconView == nil {
            leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        }
        if rightIconView == nil {
            rightIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        }
        
        leftIconView!.image = leftIcon
        leftView = leftIconView
        leftViewMode = .always
        rightIconView!.image = rightIcon
        rightView = rightIconView
        rightViewMode = .always
        
        layoutIfNeeded()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 24, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 24, dy: 0)
    }
    
}
