//
//  HXIBButton.swift
//  HXIBKit
//
//  Created by HongXiangWen on 2018/5/25.
//  Copyright © 2018年 WHX. All rights reserved.
//

import UIKit

@IBDesignable
class HXIBButton: UIButton {

    /// normal
    @IBInspectable var normalBorderColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var normalBackgroundColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    /// selected
    @IBInspectable var selectedBorderColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var selectedBackgroundColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    /// disabled
    @IBInspectable var disabledBorderColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var disabledBackgroundColor: UIColor? {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switch state {
        case .normal:
            layer.borderColor = normalBorderColor?.cgColor
            backgroundColor = normalBackgroundColor
        case .selected:
            layer.borderColor = selectedBorderColor?.cgColor
            backgroundColor = selectedBackgroundColor
        case .disabled:
            layer.borderColor = disabledBorderColor?.cgColor
            backgroundColor = disabledBackgroundColor
        default:
            break
        }
    }

}
