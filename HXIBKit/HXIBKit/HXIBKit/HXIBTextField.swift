//
//  HXIBTextField.swift
//  HXIBKit
//
//  Created by HongXiangWen on 2018/5/25.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

@IBDesignable
class HXIBTextField: UITextField {

    @IBInspectable var leftViewWidth: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var leftIcon: UIImage? {
        didSet {
            leftImageView.image = leftIcon
            setNeedsLayout()
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            setValue(placeholderColor, forKeyPath: "_placeholderLabel.textColor")
        }
    }
    
    private lazy var leftImageView: UIImageView = {
        let leftImageView = UIImageView()
        leftImageView.contentMode = .center
        return leftImageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        leftViewMode = .always
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        leftImageView.frame = CGRect(x: 0, y: 0, width: leftViewWidth, height: frame.height)
        leftView = leftImageView
    }
    
}




