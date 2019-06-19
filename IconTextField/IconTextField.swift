//
//  IconTextField.swift
//  Companion
//
//  Created by Joey Zhang on 12/6/2019.
//  Copyright © 2019 TGI. All rights reserved.
//

import UIKit

@IBDesignable public class IconTextField: UITextField {
    
    // MARK: - IBInspectable properties
    @IBInspectable public var leftImage: UIImage? = nil {
        didSet { update() }
    }
    @IBInspectable public var rightImage: UIImage? = nil {
        didSet { update() }
    }
    @IBInspectable public var imageSize: CGSize = CGSize(width: 16, height: 16) {
        didSet { update() }
    }
    
    // MARK: - Mutatable properties
    /*
     Default Password Policy:
     At least 1 uppercase letter
     At least 1 lowercase letter
     At least 1 number
     At least 8 characters long
     */
    public var  passwordPolicyRegex = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
    public var  emailRulesRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}

// MARK: - Private methods
private extension IconTextField {
    
    func update() {
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
    
}


// MARK: - Override methods
extension IconTextField {
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: bounds.origin.x + ( leftImage?.size.width ?? 0) + 8, dy: 0)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: bounds.origin.x + ( leftImage?.size.width ?? 0) + 8, dy: 0)
    }
    
}


// MARK: - Validation methods
extension IconTextField {
    
<<<<<<< HEAD
=======
    
>>>>>>> c9e3c22315a39c21cc0a703ee8b668d66c9bd83f
    /// Validate self.text according to Email rules and return a bool-type result
    ///
    /// - Returns: Bool
    func isValidEmail() -> Bool {
        if let emailString = self.text {
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRulesRegex)
            return emailPredicate.evaluate(with: emailString)
        } else {
            return false
        }
    }
    
    /// Default Password Policy:
    ///     At least 1 uppercase letter
    ///     At least 1 lowercase letter
    ///     At least 1 number
    ///     At least 8 characters long
    /// - Returns: Bool
    func isValidPassword() -> Bool {
        if let passwordString = self.text {
            let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordPolicyRegex)
            return passwordPredicate.evaluate(with: passwordString)
        } else {
            return false
        }
    }
    
}
