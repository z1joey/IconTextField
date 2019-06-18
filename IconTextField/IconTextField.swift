//
//  IconTextField.swift
//  Companion
//
//  Created by Joey Zhang on 12/6/2019.
//  Copyright © 2019 TGI. All rights reserved.
//

import UIKit

@IBDesignable public class IconTextField: UITextField {
    
    @IBInspectable public var leftImage: UIImage? = nil {
        didSet { update() }
    }
    
    @IBInspectable public var rightImage: UIImage? = nil {
        didSet { update() }
    }
    
    @IBInspectable public var imageSize: CGSize = CGSize(width: 16, height: 16) {
        didSet { update() }
    }
    
    private func update() {
        if leftImage != nil {
            leftView = UIImageView(image: leftImage)
            leftView?.frame.size = imageSize
            leftViewMode = .always
        }
        if rightImage != nil {
            rightView = UIImageView(image: rightImage)
            rightView?.frame.size = imageSize
            rightViewMode = .always
        }
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: bounds.origin.x + ( leftImage?.size.width ?? 0) + 8, dy: 0)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: bounds.origin.x + ( leftImage?.size.width ?? 0) + 8, dy: 0)
    }
    
}
